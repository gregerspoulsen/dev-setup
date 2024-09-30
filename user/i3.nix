{ config, lib, pkgs, ... }:

let 
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;

    package = pkgs.i3-gaps;
    config = {
      gaps = {
        inner = 6;
        outer = 3;
      };


      window.border = 0;
      
      modifier = mod;

      fonts = ["DejaVu Sans Mono, FontAwesome 6"];

      keybindings = lib.mkOptionDefault {
        "${mod}+p" = "exec ${pkgs.dmenu}/bin/dmenu_run";
        "${mod}+x" = "exec sh -c '${pkgs.maim}/bin/maim -s | xclip -selection clipboard -t image/png'";
        "${mod}+Shift+x" = "exec sh -c '${pkgs.i3lock}/bin/i3lock -c 222222 & sleep 5 && xset dpms force of'";
        "${mod}+Return" = "exec alacritty";

        # Focus
        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";

        # Move
        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";

        # My multi monitor setup
        "${mod}+m" = "move workspace to output DP-2";
        "${mod}+Shift+m" = "move workspace to output DP-5";
      };

      bars = [
        {
          position = "bottom";
          # statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
        }
      ];
    };
  };
}

# From Sytup
# # GP Edits Below ---------------------------------

# # mod+p to move workspace to other screen:
# bindsym $mod+p move workspace to output right
# bindsym $mod+Shift+p move workspace tAo output left

# # Interactive screenshot by pressing printscreen
# bindsym Print exec gnome-screenshot -i -c

# # Crop-area screenshot by pressing Mod + printscreen
# bindsym $mod+Print exec gnome-screenshot -a -f /tmp/screenshot.png && xclip -in -selection clipboard -target image/png /tmp/screenshot.png

# # Autostart i3wsr:
# exec_always --no-startup-id $HOME/.cargo/bin/i3wsr --config /static/config/i3/i3wsr.toml

# # Map mod+b to workspace 10 - used for browser
# bindsym $mod+b workspace 10
# # Map mod+ctrl+b to open a new browser instance
# bindsym $mod+Ctrl+b exec chromium

# bindsym $mod+Ctrl+1 exec ~/.config/i3/workspaces/productivity.sh

# # Gnome System Monitor
# bindsym $mod+Pause exec gnome-system-monitor

# # Gnome Control Center
# bindsym $mod+F12 exec gnome-control-center

# # Bind dmenu to win+shift+z
# bindsym $mod+shift+z exec dmenu_run

# # Restart Espanso to fix keyboard layout issue causing wrong characters
# exec --no-startup-id espanso restart