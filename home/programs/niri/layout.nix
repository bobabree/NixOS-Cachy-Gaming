# home/programs/niri/layout.nix
# ────────────── Layout Settings ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
{...}: {
  programs.niri.settings = {
    layout = {
      # ═══════════════════════════════════════════════════════════════
      # SPACING & POSITIONING
      # ═══════════════════════════════════════════════════════════════

      # Gaps around windows in logical pixels (can use fractional values)
      gaps = 16;

      # When to center a column when changing focus
      # Options: "never" (default), "always", "on-overflow"
      center-focused-column = "never";

      # Always center a single column on a workspace
      always-center-single-column = false;

      # Add an empty workspace at the very start
      empty-workspace-above-first = false;

      # Default display mode for new columns: "normal" or "tabbed"
      default-column-display = "normal";

      # Default background color (everforest bg0)
      background-color = "#2d353bAA";

      # ═══════════════════════════════════════════════════════════════
      # COLUMN WIDTHS
      # ═══════════════════════════════════════════════════════════════

      # Widths for switch-preset-column-width action (Mod+R)
      preset-column-widths = [
        {proportion = 0.33333;} # 1/3 of output
        {proportion = 0.5;} # 1/2 of output
        {proportion = 0.66667;} # 2/3 of output
      ];

      # Default width for new windows
      # default-column-width = {proportion = 0.5;};

      # New windows decide their initial width themselves.
      default-column-width = {};

      # ═══════════════════════════════════════════════════════════════
      # WINDOW HEIGHTS
      # ═══════════════════════════════════════════════════════════════

      # Heights for switch-preset-window-height action (Mod+Shift+R)
      preset-window-heights = [
        {proportion = 0.33333;} # 1/3 of output
        {proportion = 0.5;} # 1/2 of output
        {proportion = 0.66667;} # 2/3 of output
      ];

      # ═══════════════════════════════════════════════════════════════
      # FOCUS RING
      # ═══════════════════════════════════════════════════════════════

      focus-ring = {
        enable = true;
        width = 2;

        active = {
          gradient = {
            from = "#7fbbb3AA";
            to = "#a7c080AA";
            angle = 135;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };

        inactive = {
          color = "#475258AA";
        };

        urgent = {
          gradient = {
            from = "#e67e80AA";
            to = "#e69875AA";
            angle = 45;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };
      };

      # ═══════════════════════════════════════════════════════════════
      # BORDER
      # ═══════════════════════════════════════════════════════════════

      border = {
        enable = false;
        width = 2;

        # Active border
        active = {
          gradient = {
            from = "#a7c080AA"; # everforest green
            to = "#83c092AA"; # everforest aqua
            angle = 135;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };

        # Inactive border
        inactive = {
          color = "#475258AA"; # everforest bg3
        };

        # Urgent border with gradient and transparency
        urgent = {
          gradient = {
            from = "#e67e80AA"; # everforest red
            to = "#e69875AA"; # everforest orange
            angle = 45;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };
      };

      # ═══════════════════════════════════════════════════════════════
      # SHADOW
      # ═══════════════════════════════════════════════════════════════

      shadow = {
        enable = true;
        softness = 40;
        spread = 10;
        offset = {
          x = 2;
          y = 10;
        };
        draw-behind-window = false;
        color = "#232a2eD0"; # Increased from 90 to D0 (~82% opacity)
        inactive-color = "#232a2e80"; # Increased from 50 to 80 (~50% opacity)
      };
      # ═══════════════════════════════════════════════════════════════
      # TAB INDICATOR
      # ═══════════════════════════════════════════════════════════════

      tab-indicator = {
        enable = true;
        hide-when-single-tab = false;
        gap = 5;
        width = 4;
        # length = {
        #   total-proportion = 1.0;
        # };
        position = "left";
        gaps-between-tabs = 2;
        corner-radius = 20;

        # Active tab
        active = {
          gradient = {
            from = "#a7c080AA"; # everforest green
            to = "#83c092AA"; # everforest aqua
            angle = 45;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };

        # Inactive tab
        inactive = {
          color = "#859289AA";
        };

        # Urgent tab
        urgent = {
          gradient = {
            from = "#e67e80AA"; # everforest red
            to = "#e69875AA"; # everforest orange
            angle = 45;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };
      };

      # ═══════════════════════════════════════════════════════════════
      # INSERT HINT
      # ═══════════════════════════════════════════════════════════════

      insert-hint = {
        enable = true;
        display = {
          gradient = {
            from = "#a7c080AA";
            to = "#83c092AA";
            angle = 45;
            relative-to = "workspace-view";
            in' = "oklch shorter hue";
          };
        };
      };
      # ═══════════════════════════════════════════════════════════════
      # STRUTS
      # ═══════════════════════════════════════════════════════════════

      struts = {
        # left = 20;
        # right = 20;
        # top = 20;
        # bottom = 20;
      };
    };
  };
}
