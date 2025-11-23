# home/programs/stylix.nix
{pkgs, ...}: {
  stylix = {
    enable = true;

    # Auto-theming
    autoEnable = true;

    # Home Manager targets
    targets = {
      # Noctalia handles these
      firefox.enable = false;

      # Let Stylix handle the ones Noctalia cannot handle properly.
      alacritty.enable = true;
      bat.enable = true;
      btop.enable = true;
      fish.enable = true;
      fzf.enable = true;
      gtk.enable = true;
      helix.enable = true;
      qt.enable = true;
      tmux.enable = true;
    };

    # Cursor
    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 36;
    };

    # Opacity
    opacity = {
      terminal = 0.95;
      popups = 0.95;
    };
  };
}
