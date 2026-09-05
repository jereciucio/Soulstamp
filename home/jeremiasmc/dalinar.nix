{pkgs, ...}: {
  imports = [
    ./global
    ./features/emacs
    ./features/desktop/common
  ];
}
