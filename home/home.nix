{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./apps/utils.nix
    ./apps/theming.nix
    ./apps/nh.nix
    ./apps/git.nix
    ./apps/bash.nix
    ./apps/ghostty.nix
    ./apps/rofi.nix
    ./apps/waypaper.nix
    ./apps/swaync.nix
    ./apps/swayosd.nix
    ./apps/nemo.nix
    ./apps/swaylock.nix
    ./apps/xdg.nix
    ./apps/tmux.nix
    ./apps/direnv.nix
    ./core/waybar/waybar.nix
    ./core/mango/mango.nix
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.enableNixpkgsReleaseCheck = false;
  home = {
    username = "zenith";
    homeDirectory = "/home/zenith";
    stateVersion = "25.05";
  };
}
