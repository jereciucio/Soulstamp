{pkgs, inputs, ...}: {
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
}
