{pkgs, config, ...}: {
  programs.ssh = {
    enable = true;
  };
  home.persistence = {
    "/persist".directories = [
      {
        directory = ".ssh";
        mode = "0700";
      }
    ];
  };
}
