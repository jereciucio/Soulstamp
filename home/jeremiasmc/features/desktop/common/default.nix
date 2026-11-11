{pkgs, ...}: {
  imports = [
    ./zen-browser.nix
    ./feishin.nix
    ./nextcloud.nix
    ./texlive.nix
    ./telegram.nix
    ./whatsie.nix
    ./discord.nix
    # brave-origin was removed from nixpkgs and later re-added. This will remain commented out until it hits nixos-unstable again
    #./brave-origin.nix
    ./office.nix
    ./inkscape.nix
  ];

  home.persistence = {
    "/persist".directories = [
      ".config/Nextcloud"
    ];
  };
}
