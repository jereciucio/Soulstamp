{pkgs, ...}: {

  # Install GNOME Extensions
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    appindicator
    caffeine
  ];
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          appindicator.extensionUuid
          caffeine.extensionUuid
        ];
      };   
    };
  };

  # Persist the gnome keyring, nextcloud uses this
  home.persistence."/persist" = {
    directories = [
      ".local/share/keyrings"
    ];
  };
}
