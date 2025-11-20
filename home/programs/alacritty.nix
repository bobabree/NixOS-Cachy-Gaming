# home/programs/alacritty.nix
#===================================================================
# TERMINAL EMULATORS
#===================================================================
{...}: {
  programs.alacritty = {
    enable = true;

    # https://github.com/rose-pine/alacritty/blob/main/dist/rose-pine-dawn.toml
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

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        size = 12.0;
      };

      colors = {
        primary = {
          foreground = "#575279";
          background = "#faf4ed";
          dim_foreground = "#797593";
          bright_foreground = "#575279";
        };

        cursor = {
          text = "#575279";
          cursor = "#cecacd";
        };

        vi_mode_cursor = {
          text = "#575279";
          cursor = "#cecacd";
        };

        search = {
          matches = {
            foreground = "#797593";
            background = "#f2e9e1";
          };
          focused_match = {
            foreground = "#faf4ed";
            background = "#d7827e";
          };
        };

        hints = {
          start = {
            foreground = "#797593";
            background = "#fffaf3";
          };
          end = {
            foreground = "#9893a5";
            background = "#fffaf3";
          };
        };

        line_indicator = {
          foreground = "None";
          background = "None";
        };

        footer_bar = {
          foreground = "#575279";
          background = "#fffaf3";
        };

        selection = {
          text = "#575279";
          background = "#dfdad9";
        };

        normal = {
          black = "#f2e9e1";
          red = "#b4637a";
          green = "#286983";
          yellow = "#ea9d34";
          blue = "#56949f";
          magenta = "#907aa9";
          cyan = "#d7827e";
          white = "#575279";
        };

        bright = {
          black = "#9893a5";
          red = "#b4637a";
          green = "#286983";
          yellow = "#ea9d34";
          blue = "#56949f";
          magenta = "#907aa9";
          cyan = "#d7827e";
          white = "#575279";
        };

        dim = {
          black = "#9893a5";
          red = "#b4637a";
          green = "#286983";
          yellow = "#ea9d34";
          blue = "#56949f";
          magenta = "#907aa9";
          cyan = "#d7827e";
          white = "#575279";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
        blink_interval = 750;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };
    };
  };
}
