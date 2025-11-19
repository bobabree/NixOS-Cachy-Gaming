# home/programs/niri/outputs.nix
{...}: {
  programs.niri.settings = {
    outputs = {
      "DP-1" = {
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
