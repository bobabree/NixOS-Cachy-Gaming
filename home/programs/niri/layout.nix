# home/programs/niri/layout.nix
# ────────────── Layout Settings ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
{...}: {
  programs.niri.settings = {
    layout = {
      background-color = "#00000000";

      focus-ring = {
        enable = true;
        width = 3;
        active = {
          color = "#A8AEFF";
        };
        inactive = {
          color = "#505050";
        };
      };

      gaps = 6;

      struts = {
        left = 20;
        right = 20;
        top = 20;
        bottom = 20;
      };
    };
  };
}
