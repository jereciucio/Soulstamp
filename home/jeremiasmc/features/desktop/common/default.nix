{pkgs, ...}: {
  imports = [
    ./zen-browser.nix
    ./feishin.nix
    ./nextcloud.nix
    ./texlive.nix
  ];

  home.persistence = {
    "/persist".directories = [
      ".config/Nextcloud"
    ];
  };
}
