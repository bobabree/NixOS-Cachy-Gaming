# home/programs/default.nix
{
  pkgs,
  inputs,
  ...
}: {
  # Import all user program configurations
  imports = [
    inputs.niri.homeModules.niri
    ./alacritty.nix
    ./helix.nix
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./niri/niri.nix
  ];

  #===================================================================
  # USER PACKAGES
  #===================================================================

  home.packages = with pkgs; [
    # Fonts
    nerd-fonts.jetbrains-mono

    # CLI utilities
    tree # Directory tree viewer
    btop # Better top/htop
    wl-clipboard-rs

    # System utilities
    brightnessctl # Backlight control for laptops

    # Development essentials
    gcc # C/C++ compiler (needed for some builds)
    gh # GitHub command-line tool
  ];

  #===================================================================
  # SESSION VARIABLES
  #===================================================================

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";

    # Firefox optimizations
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
  };
}
