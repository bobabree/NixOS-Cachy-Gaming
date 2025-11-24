# home/programs/niri/rules.nix
# ────────────── Window Rules ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules
{...}: {
  programs.niri.settings = {
    # Blurred Overview Wallpaper
    # https://docs.noctalia.dev/getting-started/compositor-settings/#option-1-blurred-overview-wallpaper
    layer-rules = [
      {
        matches = [
          {
            namespace = "^noctalia-overview*";
          }
        ];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      # Opacity
      {
        matches = [
          {app-id = "Alacritty";}
          {app-id = "firefox";}
          {app-id = "vesktop";}
        ];
        opacity = 0.95;
      }

      # Browser
      # {
      #   matches = [
      #     {app-id = "firefox";}
      #     {
      #       app-id = "firefox$";
      #       title = "^Picture-in-Picture$";
      #     }
      #   ];
      #   open-on-workspace = "browser";
      # }

      # Chat
      {
        matches = [
          {app-id = "vesktop";}
          {
            app-id = "vesktop$";
            title = "^General$";
          }
        ];
        open-on-workspace = "chat";
      }

      # Floating windows
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
          {
            app-id = "vesktop$";
            title = "^General$";
          }
        ];
        open-floating = true;
      }

      {
        matches = [{}];
        geometry-corner-radius = {
          top-left = 20.0;
          top-right = 20.0;
          bottom-left = 20.0;
          bottom-right = 20.0;
        };
        clip-to-geometry = true;
      }

      # ALACRITTY - COMPLETE DOCUMENTATION EXAMPLE WITH ALL PROPERTIES
      {
        #
        # MATCHERS - Define which windows this rule applies to
        #
        matches = [
          # Match by title (regex, matches anywhere in title)
          # {title = "Alacritty";}

          # Match by app-id (regex, matches anywhere in app-id)
          {app-id = "Alacritty";}

          # Match active windows (windows with colored focus ring)
          # Every workspace has one active window
          # {is-active = true;}

          # Match the focused window (only one window system-wide has  keyboard focus)
          # {is-focused = false;}

          # Match the "active" window in its column (last focused in that column)
          # {is-active-in-column = true;}

          # Match floating windows (only works after window is already open)
          # {is-floating = true;}

          # Match windows being screencasted individually
          # {is-window-cast-target = true;}

          # Match windows requesting user attention
          # {is-urgent = true;}

          # Match only during first 60 seconds after niri starts
          # {at-startup = true;}
        ];

        #
        # WINDOW OPENING PROPERTIES - Apply once when window first opens
        #

        # Set default width (proportion of screen or fixed pixels)
        # default-column-width = {proportion = 0.5;};
        # Alternative: default-column-width = {fixed = 1200;};

        # Set default height (proportion of screen or fixed pixels)
        # default-window-height = {fixed = 450;};
        # Alternative: default-window-height = {proportion = 0.5;};

        # Open on specific monitor (by connector name or "Manufacturer Model Serial")
        # open-on-output = "HDMI-A-1";

        # Open on specific named workspace
        # open-on-workspace = "main";

        # Open as maximized column (fills available space)
        # open-maximized = true;

        # Open maximized to screen edges (no gaps)
        # open-maximized-to-edges = true;

        # Open fullscreen
        # open-fullscreen = true;

        # Open in floating layout instead of tiling
        # open-floating = true;

        # Whether to auto-focus this window when it opens
        # open-focused = false;

        #
        # DYNAMIC PROPERTIES - Apply continuously to open windows
        #

        # Draw border/focus ring as solid rectangle (true) or just border (false)
        # draw-border-with-background = false;

        # Window opacity: 0.0 = fully transparent, 1.0 = fully opaque
        # opacity = 0.5;

        # Block window from screencasts (replaced with black rectangle)
        # block-out-from = "screencast";
        # Alternative: block-out-from = "screen-capture"; (blocks from screenshots too)

        # Enable variable refresh rate when this window is visible on  VRR-capable output
        # variable-refresh-rate = true;

        # Default display mode for columns created from this window
        # Options: "tiled" or "tabbed"
        # default-column-display = "tabbed";

        # Initial position when window opens/moves to floating layout
        # Coordinates relative to working area (screen minus bars/struts)
        # default-floating-position = {
        #   x = 100;
        #   y = 200;
        #   relative-to = "bottom-left";
        #   # Options: "top-left", "top-right", "bottom-left", "bottom-right"
        #   #          "top", "bottom", "left", "right"
        # };

        # Multiplier for scroll speed (multiplied with input device scroll factor)
        # scroll-factor = 0.75;

        #
        # FOCUS RING - Active window indicator
        #
        # focus-ring = {
        #   # Enable focus ring for this window (overrides global setting)
        #   on = true; # Enable even if normally disabled (has precedence over off)
        #   # off = true;  # Disable even if normally enabled

        #   # Width in logical pixels
        #   width = 4;

        #   # Solid colors for different states
        #   active-color = "#7fc8ff"; # When window is active
        #   inactive-color = "#505050"; # When window is inactive
        #   urgent-color = "#9b0000"; # When window requests attention

        #   # Alternative: Use gradients instead of solid colors
        #   # active-gradient = {
        #   #   from = "#80c8ff";
        #   #   to = "#bbddff";
        #   #   angle = 45;
        #   # };
        #   # inactive-gradient = {
        #   #   from = "#505050";
        #   #   to = "#808080";
        #   #   angle = 45;
        #   #   relative-to = "workspace-view";
        #   # };
        #   # urgent-gradient = {
        #   #   from = "#800";
        #   #   to = "#a33";
        #   #   angle = 45;
        #   # };
        # };

        #
        # BORDER - Window border (same options as focus-ring)
        #
        # border = {
        #   on = true;
        #   width = 8;
        #   active-color = "#ff0000";
        #   inactive-color = "#333333";
        #   urgent-color = "#ffff00";
        # };

        #
        # SHADOW - Drop shadow behind window
        #
        # shadow = {
        #   # Enable/disable shadow
        #   # on = true;    # Enable even if normally disabled
        #   off = true; # Disable even if normally enabled (on has precedence)

        #   # Shadow blur radius (higher = softer shadow)
        #   softness = 40;

        #   # How far shadow extends beyond window
        #   spread = 5;

        #   # Shadow offset from window
        #   offset = {
        #     x = 0;
        #     y = 5;
        #   };

        #   # Draw shadow under window (true) or as outline (false)
        #   draw-behind-window = true;

        #   # Shadow color with alpha (RGBA hex)
        #   color = "#00000064";

        #   # Optional: Different color for inactive windows
        #   # inactive-color = "#00000064";
        # };

        #
        # TAB INDICATOR - Colored strip at top of tabbed columns
        #
        # tab-indicator = {
        #   # Solid colors for different states
        #   active-color = "red";
        #   inactive-color = "gray";
        #   urgent-color = "blue";

        #   # Alternative: Use gradients
        #   # active-gradient = {
        #   #   from = "#80c8ff";
        #   #   to = "#bbddff";
        #   #   angle = 45;
        #   # };
        #   # inactive-gradient = {
        #   #   from = "#505050";
        #   #   to = "#808080";
        #   #   angle = 45;
        #   #   relative-to = "workspace-view";
        #   # };
        #   # urgent-gradient = {
        #   #   from = "#800";
        #   #   to = "#a33";
        #   #   angle = 45;
        #   # };
        # };

        #
        # GEOMETRY - Window shape and rounding
        #

        # Corner radius in logical pixels
        # Single value applies to all corners
        # geometry-corner-radius = 12;
        # Alternative: Four values for each corner (top-left, top-right, bottom-right, bottom-left)
        # geometry-corner-radius = [8 8 0 0];

        # Clip window content to rounded geometry (cuts off square client-side corners/shadows)
        # clip-to-geometry = true;

        # Inform window it's tiled (makes it rectangular, hides CSD shadows)
        # tiled-state = true;

        # April Fools 2025: Make window float up and down
        # baba-is-float = true;

        #
        # SIZE CONSTRAINTS - Override window's min/max size
        #

        # Minimum width in logical pixels
        # min-width = 100;

        # Maximum width in logical pixels
        # max-width = 200;

        # Minimum height in logical pixels
        # min-height = 300;

        # Maximum height in logical pixels
        # Note: max-height only applies to auto-sized windows if equal to min-height
        # max-height = 300;
      }
    ];
  };
}
