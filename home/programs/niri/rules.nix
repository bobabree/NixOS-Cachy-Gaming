# home/programs/niri/rules.nix
# ────────────── Window Rules ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Window-Rules
{...}: {
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [
          {
            namespace = "^quickshell-wallpaper$";
          }
        ];
        #place-within-backdrop = true;
      }
      {
        matches = [
          {
            namespace = "^quickshell-overview$";
          }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          {
            namespace = "^swww-daemon$";
          }
        ];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      # Alacritty
      {
        matches = [
          {app-id = "Alacritty";}
        ];
        opacity = 0.95;
      }

      # Firefox
      {
        matches = [
          {app-id = "firefox";}
        ];
        # open-on-workspace = "browser";
        opacity = 0.95;
      }

      # Vesktop
      {
        matches = [
          {app-id = "vesktop";}
        ];
        # open-on-workspace = "vesktop";
      }

      # Floating windows
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }

      {
        matches = [{}];
        geometry-corner-radius = {
          top-left = 10.0;
          top-right = 10.0;
          bottom-left = 10.0;
          bottom-right = 10.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
