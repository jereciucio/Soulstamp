{pkgs, ...}: {
  imports = [
    ./git.nix
    ./fish.nix
  ];

  home.packages = with pkgs; [
    neovim # Always good to have
    bat # Better `cat`
    fzf # Fuzzy-finder
    tmux # Terminal multiplexor
    btop # Task-manager
    nh # Wrapper for NixOS commands
  ];
}
