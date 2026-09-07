{lib, ...}: {
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  environment.persistence."/persist" = {
    directories = [
      # Bluetooth state
      "/var/lib/bluetooth"

      # NetworkManager state
      "/etc/NetworkManager/system-connections"
      "/var/lib/NetworkManager"
    ];
  };
}
