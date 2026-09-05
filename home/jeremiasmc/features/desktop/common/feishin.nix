{pkgs, ...}: {
  home.packages = with pkgs; [
    feishin
  ];

  home.persistence = {
    "/persist".directories = [
      ".config/feishin"
    ];
  };
}
