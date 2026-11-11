{pkgs, ...}: {
  imports = [
    ./zen-browser.nix
    ./feishin.nix
    ./nextcloud.nix
    ./texlive.nix
    ./telegram.nix
    ./whatsie.nix
    ./discord.nix
    ./brave-origin.nix
    ./office.nix
    ./inkscape.nix
  ];

  home.persistence = {
    "/persist".directories = [
      ".config/Nextcloud"
    ];
  };
}
