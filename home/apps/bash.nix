{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    #profileExtra = ''
    #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    # exec Hyprland
    #fi
    #'';
    shellAliases = {
      sv = "sudo nvim";
      switch = "nh os switch -H ideapad";
      update = "nh os switch -u -H ideapad";
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
