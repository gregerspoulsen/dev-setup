set -e

# Resize Root Partition:
sudo resize2fs /dev/sda1

# Switch config to flake:
sudo nixos-rebuild switch --flake /vagrant/system-config --impure 


# home-manager init
# home-manager switch
# source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
# cd user
# home-manager switch --flake .#vagrant