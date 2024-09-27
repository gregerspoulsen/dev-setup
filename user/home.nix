{ lib, pkgs, ... }:
{

  imports = [
    ./git.nix
    ./vscode.nix
    ./i3.nix
  ];

  home = {
    packages = with pkgs; [
      hello
      just
    ];

    # This needs to actually be set to your username
    username = "vagrant";
    homeDirectory = "/home/vagrant";

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

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.05";
    
  };
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 10;
        outer = 5;
      };
    };
  };
}
