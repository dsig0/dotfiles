{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
  };

  outputs =
    {
      nixpkgs,
      devenv,
      systems,
      ...
    }@inputs:
    let
      forEachSystem =
        function:
        nixpkgs.lib.genAttrs (import systems) (
          system: function nixpkgs.legacyPackages.${system}
        );
    in
    {
      devShells = forEachSystem (pkgs: {
        default = devenv.lib.mkShell {
          inherit inputs pkgs;
          modules = [
            {
              # https://devenv.sh/reference/options/
              dotenv.disableHint = true;

              packages = with pkgs; [
                python3Packages.flake8
                python3Packages.black
              ];
              languages.python.uv = {
                enable = true;
                package = pkgs.uv;
              };
            }
          ];
        };
      });

      packages = forEachSystem (pkgs: { });
    };
}
