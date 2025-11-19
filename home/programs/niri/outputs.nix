# home/programs/niri/outputs.nix
# ────────────── Output Configuration ──────────────
# You can run `niri msg outputs` to get the correct name for your displays.
# You will have to remove "/-" and edit it before it takes effect.
# https://github.com/YaLTeR/niri/wiki/Configuration:-Outputs
{...}: {
  programs.niri.settings = {
    outputs = {
      "eDP-1" = {
        mode = {
          width = 2880;
          height = 1800;
          refresh = 120.000;
        };
        scale = 1.75;
        position = {
          x = 0;
          y = 0;
        };
      };
    };
  };
}
