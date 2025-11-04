{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:dsig0/nixvim";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    devenv.url = "github:cachix/devenv";

    # MangoWC
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, mango, ... }@inputs: {
    nixosConfigurations = {
      ideapad = nixpkgs.lib.nixosSystem {
         = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          mango.nixosModules.mango
          ./hosts/ideapad/configuration.nix
          home-manager.nixosModules.default
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users = { zenith = import ./home/home.nix; };
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
