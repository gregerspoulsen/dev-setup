
{ services, programs, ... }:

{

services.gnome.gnome-keyring.enable = true;
programs.i3.extraSessionCommands = ''
  eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh);
  export SSH_AUTH_SOCK;
'';

}

