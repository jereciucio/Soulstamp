{
  pkgs,
  inputs,
  ...
}: {
  programs.emacs = {
    enable = true;
    package = (
      pkgs.emacsWithPackagesFromUsePackage {
        package = pkgs.emacs-pgtk;
        config = ./init.el;
        extraEmacsPackages = epkgs: [
          epkgs.use-package
        ];
      }
    );
    extraConfig = builtins.readFile ./init.el;
  };

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  home.packages = [
    pkgs.emacs-all-the-icons-fonts # Required by the Emacs config
  ];
}
