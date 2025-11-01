{ config, pkgs, ... }:

{
  # Configure keymap in X11

  console.keyMap = "us";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
