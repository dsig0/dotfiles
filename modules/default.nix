{ config, ... }:

{
  imports = [
    ./desktop/desktopmanager.nix
    ./desktop/windowmanager.nix
    ./desktop/greeter.nix
    ./bootloader.nix
    ./gc.nix
    ./zone.nix
    ./keymap.nix
    ./services.nix
    ./virtualization.nix
  ];
}
