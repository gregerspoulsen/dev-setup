{ config, lib, pkgs, ... }:

{

  # xdg.enable = true;
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      # startup = [
      #   # https://github.com/NixOS/nixpkgs/issues/119445
      #   {command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK";}
      # ];
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "alacritty"; 
    };
  };
}