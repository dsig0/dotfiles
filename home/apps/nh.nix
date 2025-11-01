{ pkgs, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/zenith/dotfiles";
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
  };

  home.packages = with pkgs; [
    nix-output-monitor
    nvd
  ]; 
}
