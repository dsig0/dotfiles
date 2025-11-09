{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      mkdirenv() {
        nix flake init --template github:dsig0/dotfiles#"$1"
      }

      redirenv() {
        rm -rf .direnv .devenv
      }
    '';
    shellAliases = {
      sv = "sudo nvim";
      switch = "nh os switch";
      update = "nh os switch --update";
      gcclean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";
      n = "nvim";
      ls = "eza --icons";
      ll = "eza -lh --icons --grid --group-directories-first";
      la = "eza -lah --icons --grid --group-directories-first";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      config = "cd ~/.config";
      btw = "echo I use nixos, btw";
      cat = "bat";
    };
  };
}
