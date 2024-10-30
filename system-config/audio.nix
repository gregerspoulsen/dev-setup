
{ pkgs, ... }: 


{
  # Enable Pulse Audio
  services.pipewire.enable = false;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
}



