{ config, pkgs, callPackage, ... }: 


{

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  services.xserver.xkb.layout = "dk";
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      wallpaper.mode = "fill";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
  };

  # Enable unlock of SSH keys with keyring
  services.gnome.gnome-keyring.enable = true;
  services.xserver.windowManager.i3.extraSessionCommands = ''
  eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh);
  export SSH_AUTH_SOCK;
  '';

}