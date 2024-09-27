{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.

  programs.zsh.enable = true;

  users.users = {
    # FIXME: Replace with your username
    gp = {
      initialPassword = "test";
      isNormalUser = true;
      shell = pkgs.zsh;
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

  # Set locale:
  console.keyMap = "dk";
  i18n = {
    defaultLocale = "en_DK.UTF-8";
  };

  system.stateVersion = "24.05";
}
