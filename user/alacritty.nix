{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      keyboard.bindings = [
        {
        key = "N";
        mods = "Command";
        action = "SpawnNewInstance";
        }
      ];
      font.size = 10;
      font.normal.family="Source Code Pro for Powerline";
    };
  };
  home.packages = with pkgs; [
    powerline-fonts
    ];
}