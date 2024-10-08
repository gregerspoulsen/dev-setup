{ lib, pkgs, ... }:

{

  imports = [
    ./git.nix
    ./vscode.nix
    ./i3.nix
    ./zsh.nix
    ./alacritty.nix
    ./ssh.nix
    ./espanso.nix
  ];

  

  home = {
    packages = with pkgs; [
      hello
      just
      slack
      home-manager
      google-chrome
      python3
      usbutils  
    ];

    # This needs to actually be set to your username
    username = "gp";
    homeDirectory = "/home/gp";

    file = {
      ".background-image" = {
        source = builtins.fetchurl {
          url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/wallpapers/nix-wallpaper-simple-blue.png";
          sha256 = "1llr175m454aqixxwbp3kb5qml2hi1kn7ia6lm7829ny6y7xrnms";
        };
      };
    };



    keyboard.layout = "dk";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";

  };

}
