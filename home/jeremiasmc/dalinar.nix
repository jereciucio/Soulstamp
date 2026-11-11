{pkgs, ...}: {
  imports = [
    ./global
    ./features/emacs
    ./features/desktop/common
    ./features/desktop/gnome
    ./features/gaming/nethack.nix
    ./features/gaming/go.nix
    ./features/development/node.nix
    ./features/design
    ./features/desktop/common/mision-control.nix
  ];

}
