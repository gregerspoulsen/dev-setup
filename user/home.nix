{ lib, pkgs, ... }:
{

  imports = [
    ./git.nix
    ./vscode.nix
    #./i3.nix
    ./zsh.nix
    ./alacritty.nix
  ];

  home = {
    packages = with pkgs; [
      hello
      just
      slack
      home-manager
      google-chrome
    ];

    # This needs to actually be set to your username
    username = "gp";
    homeDirectory = "/home/gp";

    file = {
      "hello.txt" = {
        text = ''
          #!/usr/bin/env bash

          echo "Hello, world!"
          echo '*slaps roof* This script can fit so many lines in it'
        '';
        executable = true;
      };
    };

    keyboard.layout = "dk";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.05";

  };

}
