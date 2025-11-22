# home/programs/default.nix
{pkgs, ...}: {
  # Import all user program configurations
  imports = [
    ./alacritty.nix # Terminal emulator config
    ./helix.nix # Text editor config
    ./firefox.nix # Browser config
    ./fish.nix # Shell config
    ./git.nix # Version control config
    ./niri # Window manager (finds ./niri/default.nix automatically)
  ];

  #===================================================================
  # USER PACKAGES
  #===================================================================

  home.packages = with pkgs; [
    # Apps
    teams-for-linux # Microsoft Teams client

    # Fonts
    nerd-fonts.jetbrains-mono

    # CLI utilities
    tree # Directory tree viewer
    btop # Better top/htop
    wl-clipboard-rs
    ripgrep

    # System utilities
    brightnessctl # Backlight control for laptops

    # Development essentials
    cargo # Rust
    gcc # C/C++ compiler (needed for some builds)
    gh # GitHub command-line tool

    # Cursor
    rose-pine-cursor

    # Night Light
    gammastep

    # Niri
    swaybg # static background
    xwayland-satellite
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
    GTK_USE_PORTAL = "1"; # Force Firefox to use XDG portal for screensharing

    # Wayland enviroment (from niri)
    # https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#environment
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";
    DISPLAY = ":0";
  };
}
