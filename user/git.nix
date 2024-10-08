{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "gp@skytem.com";
    userName = "Gregers Poulsen";
    extraConfig = {
      safe.directory ="/dev-setup";
    };
  };
}