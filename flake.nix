{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    nixneovimplugins.url = "github:NixNeovim/NixNeovimPlugins";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nil,
    catppuccin,
    nixneovimplugins,
    ...
  }: let
    system = "x86_64-linux";
  in {
    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.alex-linux = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users.alex = {
              imports = [
                ./home
                catppuccin.homeModules.catppuccin
              ];
            };

            extraSpecialArgs = {
              inherit (nil.packages.${system}) nil;
              inherit inputs system;
            };
          };
        }
      ];

      specialArgs = {
        inherit system inputs;
      };
    };
  };
}
