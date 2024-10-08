{ config, pkgs, ... }:

{
  imports = [ ./i3.nix ];
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.

  programs.zsh.enable = true;
  virtualisation.docker.enable = true;
  programs.thunar.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  users.users = {
    # FIXME: Replace with your username
    gp = {
      initialPassword = "test";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "docker"]; # Apparently this give sudo :D
    };
  };

  environment.systemPackages = with pkgs; [
      git
      home-manager
      ];

  # Enable Flakes:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set locale:
  console.keyMap = "dk";
  i18n = {
    defaultLocale = "en_DK.UTF-8";
  };

  system.stateVersion = "24.11";
}
