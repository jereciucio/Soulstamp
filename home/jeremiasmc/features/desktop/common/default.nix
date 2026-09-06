{pkgs, ...}: {
  imports = [
    ./zen-browser.nix
    ./feishin.nix
    ./nextcloud.nix
  ];

  home.persistence = {
    "/persist".directories = [
      ".config/Nextcloud"
    ];
  };
}
