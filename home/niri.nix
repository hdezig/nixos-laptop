{
  config,
  ...
}:
{
  programs.niri = {
    enable = true;
    settings = {
      hotkey-overlay.skip-at-startup = true;

      input = {
        keyboard = {
          numlock = true;
        };
        touchpad = {
          enable = true;
          natural-scroll = true;
          tap = true;
        };
        mouse = {
        };
        trackpoint = {
        };
      };

      cursor = {
        hide-when-typing = true;
      };

      # debug = {
      #   honor-xdg-activations-with-invalid-serial = [];
      # };

      window-rules = [
        {
          matches = [
            { app-id = "helium"; }
            { app-id = "dev.zed.Zed"; }
            { app-id = "helium"; }
            { app-id = "ghostty"; }
          ];
          open-maximized = true;
        }
        {
          geometry-corner-radius = {
            top-left = 0.0;
            top-right = 0.0;
            bottom-left = 0.0;
            bottom-right = 0.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [
            { title = "Picture-in-Picture"; }
            { title = "Picture in picture"; }
          ];
          open-floating = true;
          default-floating-position = {
            relative-to = "bottom-right";
            x = 16;
            y = 16;
          };
        }

        {
          matches = [
            {
              app-id = "steam";
              title = "^notificationtoasts_\\d+_desktop$";
            }
          ];
          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
        }

        {
          matches = [
            { app-id = "xdg-desktop-portal-gtk"; }
            { title = "Steam Settings"; }
            { title = "Friends List"; }
          ];
          open-floating = true;
          default-floating-position = {
            relative-to = "top";
            x = 16;
            y = 16;
          };
        }
      ];

      layer-rules = [
        {
          matches = [
            {
              namespace = "^quickshell-overview$";
            }
          ];
          place-within-backdrop = true;
        }
      ];

      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          position = {
            x = 1280;
            y = 0;
          };
        };
      };

      layout = {
        gaps = 16;
        center-focused-column = "never";
        border = {
          enable = false;
          width = 4;
          active.color = "#ffc87f";
          inactive.color = "#505050";
          urgent.color = "#9b0000";
        };
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
        default-column-width.proportion = 0.5;
        focus-ring = {
          enable = false;
          width = 0.5;
          active.color = "#7fc8ff";
          inactive.color = "#505050";
        };
        shadow = {
          enable = true;
          color = "#0007";
          softness = 30;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
        };
      };

      prefer-no-csd = true;

      spawn-at-startup = [
        # {
        #   argv = [
        #     "linux-wallpaperengine"
        #     "2347484937"
        #     "-s"
        #     "-r"
        #     "eDP-1"
        #   ];
        # }
        {
          argv = [
            "noctalia-shell"
          ];
        }
      ];

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      animations = {
        enable = true;
      };

      environment = {
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      };

      binds = with config.lib.niri.actions; {
        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

        "XF86MonBrightnessUp".action = spawn [
          "noctalia-shell"
          "ipc"
          "call"
          "brightness"
          "increase"
        ];
        "XF86MonBrightnessDown".action = spawn [
          "noctalia-shell"
          "ipc"
          "call"
          "brightness"
          "decrease"
        ];

        "Mod+Shift+Slash".action = show-hotkey-overlay;
        "Mod+T" = {
          action = spawn "ghostty";
          repeat = false;
          hotkey-overlay.title = "Open <b>Ghostty</b> Terminal";
        };
        "Mod+Shift+E" = {
          action = quit;
          hotkey-overlay.title = "Logout";
        };
        "Mod+D" = {
          action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
          hotkey-overlay.title = "Launcher";
        };
        "Mod+Alt+L" = {
          action = spawn [
            "noctalia-shell"
            "ipc"
            "call"
            "lockScreen"
            "toggle"
          ];
          hotkey-overlay.title = "lockscreen";
        };

        "Mod+O" = {
          action = toggle-overview;
          repeat = false;
        };

        "Mod+Q".action = close-window;
        "Mod+Left".action = focus-column-left;
        "Mod+Down".action = focus-window-down;
        "Mod+Up".action = focus-window-up;
        "Mod+Right".action = focus-column-right;
        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+Ctrl+Left".action = move-column-left;
        "Mod+Ctrl+Down".action = move-window-down;
        "Mod+Ctrl+Up".action = move-window-up;
        "Mod+Ctrl+Right".action = move-column-right;
        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+J".action = move-window-down;
        "Mod+Ctrl+K".action = move-window-up;
        "Mod+Ctrl+L".action = move-column-right;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        "Mod+Shift+Left".action = focus-monitor-left;
        "Mod+Shift+Down".action = focus-monitor-down;
        "Mod+Shift+Up".action = focus-monitor-up;
        "Mod+Shift+Right".action = focus-monitor-right;
        "Mod+Shift+H".action = focus-monitor-left;
        "Mod+Shift+J".action = focus-monitor-down;
        "Mod+Shift+K".action = focus-monitor-up;
        "Mod+Shift+L".action = focus-monitor-right;

        "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
        "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;
        "Mod+Page_Down".action = focus-workspace-down;
        "Mod+Page_Up".action = focus-workspace-up;
        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;
        "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
        "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
        "Mod+Ctrl+U".action = move-column-to-workspace-down;
        "Mod+Ctrl+I".action = move-column-to-workspace-up;

        "Mod+Shift+Page_Down".action = move-workspace-down;
        "Mod+Shift+Page_Up".action = move-workspace-up;
        "Mod+Shift+U".action = move-workspace-down;
        "Mod+Shift+I".action = move-workspace-up;

        "Mod+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-workspace-down;
        };
        "Mod+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-workspace-up;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-down;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-up;
        };

        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+Ctrl+WheelScrollRight".action = move-column-right;
        "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

        "Mod+Shift+WheelScrollDown".action = focus-column-right;
        "Mod+Shift+WheelScrollUp".action = focus-column-left;
        "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Ctrl+1" = {
          action.move-column-to-workspace = 1;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>1</b>";
        };
        "Mod+Ctrl+2" = {
          action.move-column-to-workspace = 2;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>2</b>";
        };
        "Mod+Ctrl+3" = {
          action.move-column-to-workspace = 3;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>3</b>";
        };
        "Mod+Ctrl+4" = {
          action.move-column-to-workspace = 4;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>4</b>";
        };
        "Mod+Ctrl+5" = {
          action.move-column-to-workspace = 5;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>5</b>";
        };
        "Mod+Ctrl+6" = {
          action.move-column-to-workspace = 6;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>6</b>";
        };
        "Mod+Ctrl+7" = {
          action.move-column-to-workspace = 7;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>7</b>";
        };
        "Mod+Ctrl+8" = {
          action.move-column-to-workspace = 8;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>8</b>";
        };
        "Mod+Ctrl+9" = {
          action.move-column-to-workspace = 9;
          repeat = false;
          hotkey-overlay.title = "Move Column to Workspace <b>9</b>";
        };

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+Ctrl+F".action = expand-column-to-available-width;

        "Mod+C".action = center-column;

        "Mod+Ctrl+C".action = center-visible-columns;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Mod+W".action = toggle-column-tabbed-display;

        "Print" = {
          action.screenshot = { };
          repeat = false;
        };
        "Ctrl+Print" = {
          action.screenshot-screen = { };
          repeat = false;
        };
        "Alt+Print" = {
          action.screenshot-window = { };
          repeat = false;
        };

        "Mod+Escape" = {
          allow-inhibiting = false;
          action = toggle-keyboard-shortcuts-inhibit;
        };

        "Ctrl+Alt+Delete".action = quit;

        "Mod+Shift+P".action = power-off-monitors;
      };
    };
  };

}
