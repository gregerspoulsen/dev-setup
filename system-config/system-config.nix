{ config, pkgs, ... }:

{
  imports = [ ./i3
              ./audio.nix ];
  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.

  programs.zsh.enable = true;
  virtualisation.docker.enable = true;
  programs.thunar.enable = true;
  virtualisation.virtualbox.guest.enable = true;

  services.gvfs.enable = true; # Add support for MTP (Android File Transfer)

  # Enable automatic time-zone update:
  # Doesn't work right now
  # Nov 12 08:52:59 nixos .geoclue-wrappe[1167]: Failed to open /etc/geoclue/conf.d/: Error opening directory “/etc/geoclue/conf
  # Pending https://github.com/NixOS/nixpkgs/issues/327464 to hit unstable
  services.geoclue2.enable = true;
  services.localtimed.enable = true;

  # Enable avahi to support mdns lookup:
  services.avahi.enable = true;

  # Enable twingate (requires unfree predicate)
  nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  services.twingate.enable = true;

  # Enable libvirt to manage virtual machines
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users = {
    # FIXME: Replace with your username
    gp = {
      initialPassword = "test";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "docker" "vagrant" "libvirtd" "kvm"]; # Apparently wheel give sudo :D
    };
  };

  environment.systemPackages = with pkgs; [
      git
      home-manager
      busybox # nslookup and more
      gnome-screenshot
      xclip # manage x clipboard from command line
      wmctrl # used to set urgency on windows that send a notification
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
