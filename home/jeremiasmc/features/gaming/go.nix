{pkgs, ...}: {
  home.packages = [
    pkgs.weiqihub
    pkgs.sabaki
  ];

  home.persistence."/persist" = {
    directories = [".config/sabaki"];
  };
}
