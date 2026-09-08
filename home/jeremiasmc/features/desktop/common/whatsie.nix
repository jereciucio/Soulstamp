{pkgs, ...}: {
  home.packages = [
    pkgs.whatsie
  ];

  home.persistence."/persist" = {
    directories = [
      ".local/share/org.keshavnrj.ubuntu/WhatSie"
    ];
  };
}
