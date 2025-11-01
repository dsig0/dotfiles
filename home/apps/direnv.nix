_: {
  programs.direnv = {
    enable = true;
    silent = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  home.shellAliases = {
    mkdirenv = "nix flake init --template github:hemanth-92/dotfiles#\"$1\"";
    redirenv = "rm -r .direnv .devenv";
  };
}
