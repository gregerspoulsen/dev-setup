{ config, pkgs, ... }:

{
  # Enable Flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Add git to support flakes:
  environment.systemPackages = with pkgs; [
      git
      ];

  # Grow partition on boot:
  boot.growPartition = true;

}
