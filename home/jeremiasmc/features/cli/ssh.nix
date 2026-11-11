{
  pkgs,
  config,
  ...
}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
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
