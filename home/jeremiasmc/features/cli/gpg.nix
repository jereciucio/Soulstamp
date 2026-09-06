{pkgs, ...}: {
  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3;
  };

  home.persistence = {
    "/persist".directories = [
      {
        directory = ".gnupg";
        mode = "0700";
      }
    ];
  };
}
