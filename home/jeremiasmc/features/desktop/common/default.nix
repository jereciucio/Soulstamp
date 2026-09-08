{pkgs, ...}: {
  imports = [
    ./zen-browser.nix
    ./feishin.nix
    ./nextcloud.nix
    ./texlive.nix
    ./telegram.nix
    ./whatsie.nix
  ];

  home.persistence = {
    "/persist".directories = [
      ".config/Nextcloud"
    ];
  };
}
