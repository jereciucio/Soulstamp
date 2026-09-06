{
  description = "Soulstamp - Jere's NixOS config :)";

  inputs = {
    # Nix-related
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Things not in nixpkgs (yet) :P
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    # We only do AMD64 linux for now...
    systems = [
      "x86_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Formatter for nixlang files. use with `nix fmt filename.nix`
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # NixOS host configurations
    nixosConfigurations = {
      hoid = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/nixos/hoid];
      };

      dalinar = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [./hosts/nixos/dalinar];
      };
    };
  };
}
