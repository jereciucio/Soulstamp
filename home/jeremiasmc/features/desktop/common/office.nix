{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice
    onlyoffice-desktopeditors

    # Fonts for the slides
    montserrat
    poppins
  ];

}
