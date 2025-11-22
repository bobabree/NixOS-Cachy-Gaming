# home/programs/niri/layout.nix
# ────────────── Layout Settings ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
{...}: {
  programs.niri.settings = {
    layout = {
      background-color = "#00000000";

      focus-ring = {
        enable = true;
        width = 1.5;
        active = {
          color = "#A8AEFFAA";
        };
        inactive = {
          color = "#505050AA";
        };
      };

      gaps = 6;

      shadow = {
        enable = true;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        draw-behind-window = true;
        color = "#57527970"; # text color with transparency
        inactive-color = "#79759354"; # subtle with lower transparency
      };

      struts = {
        left = 20;
        right = 20;
        top = 20;
        bottom = 20;
      };
    };
  };
}
