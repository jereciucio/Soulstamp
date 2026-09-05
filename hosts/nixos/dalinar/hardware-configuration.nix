{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ../common/optional/autorestore-btrfs.nix
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
  ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # This laptop has 2 disks:
  # - A fast 256GB NVMe.
  # - A slow 2.5'' 1TB HDD.
  # This will auto-partition it with disko, using impermanence.
  # - /persist will persist files on the NVMe.
  # - /bulk-persist will persist files on the HDD.
  disko.devices.disk = {
    main = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            size = "1M";
            type = "EF02";
          };
          esp = {
            name = "ESP";
            size = "1024M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              postCreateHook = ''
                MNTPOINT=$(mktemp -d)
                mount -t btrfs "$device" "$MNTPOINT"
                trap 'umount $MNTPOINT; rm -d $MNTPOINT' EXIT
                btrfs subvolume snapshot -r $MNTPOINT/root $MNTPOINT/root-blank
              '';
              subvolumes = {
                "/root" = {
                  mountOptions = ["compress=zstd:1" "noatime"];
                  mountpoint = "/";
                };
                "/nix" = {
                  mountOptions = ["compress=zstd:1" "noatime"];
                  mountpoint = "/nix";
                };
                "/persist" = {
                  mountOptions = ["compress=zstd:1" "noatime"];
                  mountpoint = "/persist";
                };
                "/swap" = {
                  mountOptions = ["compress=zstd:1" "noatime"];
                  mountpoint = "/swap";
                  swap.swapfile = {
                    size = "16384M";
                    path = "swapfile";
                  };
                };
              };
            };
          };
        };
      };
    };
    bulk = {
      device = "/dev/sda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          root = {
            size = "100%";
            content = {
              type = "btrfs";
              subvolumes = {
                "/bulk-persist" = {
                  mountOptions = ["compress-force=zstd:5" "noatime"];
                  mountpoint = "/bulk-persist";
                };
              };
            };
          };
        };
      };
    };
  };
  fileSystems."/persist".neededForBoot = lib.mkDefault true;
  fileSystems."/bulk-persist".neededForBoot = lib.mkDefault true;
}
