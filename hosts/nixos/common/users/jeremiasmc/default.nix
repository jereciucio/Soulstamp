{
  config,
  pkgs,
  ...
}: {
  users.mutableUsers = false;
  users.users.jeremiasmc = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
    ];
    initialPassword = "mypassword";
  };

  # Import the home-manager config corresponding to the host
  home-manager.users.jeremiasmc = import ../../../../../home/jeremiasmc/${config.networking.hostName}.nix;
}
