{pkgs, ...}: {
  home.packages = [
    (pkgs.texliveFull.overrideAttrs {withDocs = true;})
  ];
}
