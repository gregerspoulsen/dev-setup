#! /usr/bin/env bash

set -eu

# --- Make sure Git is available -----------------------------------------------
if [ -f /etc/NIXOS ]; then
    echo "Running on NixOS - using nix shell..."
    # Make sure git is installed
    nix-shell -p git --run ./scripts/clone-repo.sh
elif ! command -v git >/dev/null 2>&1; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
else
    ./scripts/clone-repo.sh
fi

# Apply Flake:
cd /dev-setup
./apply.sh