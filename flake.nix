{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    # Stylix theme input
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:hemanth-92/nixvim";

    devenv.url = "github:cachix/devenv";

    # MangoWC
    mango = {
      url = "github:DreamMaoMao/mango";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      stylix,
      home-manager,
      mango,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        ideapad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            mango.nixosModules.mango
            stylix.nixosModules.stylix
            ./hosts/ideapad/configuration.nix
            home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users = {
                  zenith = import ./home/home.nix;
                };
                backupFileExtension = "backup";
                overwriteBackup = true;
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
      templates = import ./templates/default.nix;
    };
}
