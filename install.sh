#! /usr/bin/env nix-shell
#!nix-shell -p git

set -eu

# # --- Make sure Git is available -----------------------------------------------
# if [ -f /etc/NIXOS ]; then
#     echo "Running on NixOS - try to install git"
#     # Make sure git is installed
#     nix-shell -p git
# fi

# if ! command -v git >/dev/null 2>&1; then
#     echo "Git is not installed. Please install Git and try again."
#     exit 1
# fi


# --- Clone Repository ---------------------------------------------------------
sudo mkdir -p /dev-setup
sudo chown $USER /dev-setup
git clone https://github.com/gregerspoulsen/dev-setup.git /dev-setup
cd /dev-setup

# Apply Flake:
./apply.sh