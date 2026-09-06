{pkgs, ...}: {
  imports = [
    ./global
    ./features/emacs
    ./features/desktop/common
    ./features/desktop/gnome
  ];
}
