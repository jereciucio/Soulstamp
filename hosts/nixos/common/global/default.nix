{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.impermanence.nixosModules.impermanence
    ./persistence.nix
    ./fish.nix
    ./nix.nix
    ./tailscale.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    # Make home-manager continue even if it deletes existing configs
    backupFileExtension = "backup"; 
  };
  
  hardware.enableRedistributableFirmware = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      inputs.emacs-overlay.overlays.default
    ];
  };
}
