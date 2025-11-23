# home/programs/stylix.nix
{pkgs, ...}: {
  stylix = {
    enable = true;

    # Auto-theming
    autoEnable = true;

    # Static scheme for now
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    # Home Manager targets
    targets = {
      # Noctalia handles these
      alacritty.enable = true;
      firefox.enable = true;
      gtk.enable = true;
      qt.enable = true;

      # Let Stylix handle the ones Noctalia can't
      helix.enable = true;
      fish.enable = true;
      btop.enable = true;
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
