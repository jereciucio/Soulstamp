{pkgs, ...}: let
  # Override package build to fix nextcloud-client crashing
  # on GNOME. See https://github.com/NixOS/nixpkgs/issues/463016
  nextcloud-client = pkgs.nextcloud-client.overrideAttrs (old: {
    qtWrapperArgs =
      (old.qtWrapperArgs or [])
      ++ ["--prefix XDG_DATA_DIRS : ${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"];
  });
in {
  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
    package = nextcloud-client;
  };
}
