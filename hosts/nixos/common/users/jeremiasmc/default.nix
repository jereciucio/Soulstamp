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
    hashedPasswordFile = config.sops.secrets.jeremiasmc_passwordhash.path;
  };

  sops.secrets = {
    jeremiasmc_passwordhash = {
      sopsFile = ../../../../secrets.yaml;
      neededForUsers = true;
    };
  };

  # Import the home-manager config corresponding to the host
  home-manager.users.jeremiasmc = import ../../../../../home/jeremiasmc/${config.networking.hostName}.nix;
}
