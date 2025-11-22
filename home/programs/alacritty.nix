# home/programs/alacritty.nix
#===================================================================
# TERMINAL EMULATORS
#===================================================================
{...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.95;
        blur = true;
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "none";
        dynamic_padding = true;
      };
    };
  };
}
