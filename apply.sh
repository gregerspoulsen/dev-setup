#! /usr/bin/env nix-shell
#!nix-shell -p git -i bash

TARGET=${1:-vbox}

set -eu

today=`date +%Y%m%d`
revision=`(cd /dev-setup/ ; git rev-parse HEAD)`
read -p "Enter description: " description
export NIXOS_LABEL_VERSION="$today-${revision:0:7} $description"
sudo nixos-rebuild switch --flake /dev-setup/targets/$TARGET/#nixos