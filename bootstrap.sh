#! /usr/bin/env nix-shell
#!nix-shell -p git -i bash

set -e

# Resize Root Partition:
sudo resize2fs /dev/sda1

# Switch config to flake:
cd /dev-setup
sudo nixos-rebuild switch --flake /dev-setup/targets/vbox/#nixos




# home-manager init
# home-manager switch
# source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
# cd user
# home-manager switch --flake .#vagrant