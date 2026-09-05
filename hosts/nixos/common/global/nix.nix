{
  nix = {
    settings = {
      # Automatically hardlinks identical files in the nix store
      auto-optimise-store = true;

      # Enables flakes and the new `nix` command
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  # Enable the `nh` command, a nicer frontend for nix
  programs.nh = {
    enable = true;
  };
}
