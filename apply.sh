#! /usr/bin/env nix-shell
#!nix-shell -p git -i bash

TARGET=${1:-vbox}

set -eu

cd /dev-setup
sudo nixos-rebuild switch --flake /dev-setup/targets/$TARGET/#nixos