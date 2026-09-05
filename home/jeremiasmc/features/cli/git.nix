{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jeremías Agustín Martinez Ciucio";
        email = "jeremias@jeremiasmartinez.com";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
