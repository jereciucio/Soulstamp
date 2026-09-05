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
  ];

  networking = {
    hostName = "dalinar";
    networkmanager.enable = true;
  };

  system.stateVersion = "26.05";
}
