# home/programs/stylix.nix
{pkgs, ...}: {
  stylix = {
    enable = true;

    # Auto-theming
    autoEnable = true;

    # Home Manager targets
    targets = {
      # Noctalia handles these
      alacritty.enable = true;
      gtk.enable = true;
      qt.enable = true;

      # Let Stylix handle the ones Noctalia cannot handle properly.
      bat.enable = true;
      btop.enable = true;
      fish.enable = true;
      fzf.enable = true;
      helix.enable = true;
      tmux.enable = true;
      yazi.enable = true;

      firefox = {
        enable = true;
        profileNames = ["default"];
        firefoxGnomeTheme.enable = false;
        colorTheme.enable = true;
      };

      nixcord = {
        enable = true;
      };
    };

    # Cursor
    cursor = {
      package = pkgs.everforest-cursors;
      name = "everforest-cursors";
      size = 36;
    };

    # Opacity
    opacity = {
      terminal = 0.95;
      popups = 0.95;
    };
  };
}
