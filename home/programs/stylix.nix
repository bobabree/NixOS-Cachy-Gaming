{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix = {
    enable = true;

    # Disable auto-theming
    autoEnable = false;

    # Static scheme for now
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # Home Manager targets
    targets = {
      # Noctalia handles these
      alacritty.enable = false;
      firefox.enable = false;
      gtk.enable = false;
      qt.enable = false;

      # Let Stylix handle the ones Noctalia can't
      helix.enable = true;
      # fish.enable = true;
      # btop.enable = true;
    };

    # Fonts - Match Noctalia
    fonts = {
      serif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        terminal = 11;
        applications = 11;
      };
    };

    # Cursor
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePineDawn-Linux";
      size = 36;
    };

    # Opacity
    opacity = {
      terminal = 0.95;
      popups = 0.95;
    };
  };
}
