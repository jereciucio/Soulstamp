{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.impermanence.nixosModules.impermanence
    inputs.sops-nix.nixosModules.sops
    ./persistence.nix
    ./fish.nix
    ./nix.nix
    ./tailscale.nix
    ./sops.nix
    ./openssh.nix
  ];

  time.timeZone = "America/Argentina/Buenos_Aires";

  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
    options = "ctrl:nocaps";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    # Make home-manager continue even if it deletes existing configs
    backupFileExtension = "backup";
  };

  hardware.enableRedistributableFirmware = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.emacs-overlay.overlays.default
    ];
  };
}
