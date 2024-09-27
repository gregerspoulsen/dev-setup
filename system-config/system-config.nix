{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    gp = {
      initialPassword = "test";
      isNormalUser = true;
    };
  };

  home-manager.users.vagrant = (import ../user/home.nix);

  environment.systemPackages = with pkgs; [
      git
      ];

  # Enable Flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Grow partition on boot:
  boot.growPartition = true;

  system.stateVersion = "24.05";
}
