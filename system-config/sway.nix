
{ services, ... }: 


{
  security.polkit.enable = true;
  programs.light.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  hardware.opengl = {
    enable = true;
  };
}





