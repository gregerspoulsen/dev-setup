#! /usr/bin/env nix-shell
#!nix-shell -p git -i bash

TARGET=${1:-vbox}

set -eu

sudo nixos-rebuild switch --flake /dev-setup/targets/$TARGET/#nixos