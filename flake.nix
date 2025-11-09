{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nixvim.url = "github:dsig0/nixvim";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    devenv.url = "github:cachix/devenv";

    scenefx = {
      url = "github:wlrfx/scenefx?rev=7f9e7409f6169fa637f1265895c121a8f8b70272";
      flake = false;
    };

    mangowc = {
      url = "github:DreamMaoMao/mangowc?rev=df46194b5f720eaa9650e16d316a2bb340d424f8";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-config = {
      url = "github:dsig0/nvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      mangowc,
      nvim-config,
      ...
    }@inputs:
    {
      nixosConfigurations.ideapad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/ideapad/configuration.nix
          home-manager.nixosModules.default
          mangowc.nixosModules.mango

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.zenith = {
                imports = [
                  ./home/home.nix
                  nvim-config.homeManagerModules.default
                ];

                home.username = "zenith";
                home.homeDirectory = "/home/zenith";
              };

              backupFileExtension = "backup";
              overwriteBackup = true;
              extraSpecialArgs = { inherit inputs; };
            };
          }
        ];
      };

      templates = import ./templates/default.nix;
    };
}
