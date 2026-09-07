{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jeremiasmc
    ../common/optional/gnome.nix
    ../common/optional/wireless.nix
  ];

  networking = {
    hostName = "dalinar";
  };
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  system.stateVersion = "26.05";
}
