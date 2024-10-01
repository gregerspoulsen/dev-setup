set -e

# Resize Root Partition:
sudo resize2fs /dev/sda1

# Install home-manager:
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --update


# Switch config to flake:
./install.sh




# home-manager init
# home-manager switch
# source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
# cd user
# home-manager switch --flake .#vagrant