{pkgs, ...}: {
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    neovim
    bat # Better `cat`
    fzf # Fuzzy-finder
    tmux # Terminal multiplexor
    btop # Task-manager
    nh # Wrapper for NixOS commands
  ];
}
