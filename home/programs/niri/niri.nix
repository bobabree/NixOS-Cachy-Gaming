# home/programs/niri/niri.nix
{...}: {
  #===================================================================
  # DISPLAY & WINDOW MANAGERS
  #===================================================================

  # Niri - Scrollable-tiling Wayland compositor
  programs.niri.enable = true;
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}
