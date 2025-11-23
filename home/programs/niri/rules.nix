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

      # Vesktop
      {
        matches = [
          {app-id = "vesktop";}
        ];
        open-on-workspace = "vesktop";
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
            title = "^[^|]+$"; # Matches titles without "|" character
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
    ];
  };
}
