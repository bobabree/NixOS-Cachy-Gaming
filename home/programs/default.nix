# home/programs/default.nix
{pkgs, ...}: {
  # Import all user program configurations
  imports = [
    ./alacritty.nix # Terminal emulator config
    ./btop.nix # System monitor
    ./helix.nix # Text editor config
    ./firefox.nix # Browser config
    ./fish.nix # Shell config
    ./git.nix # Version control config
    ./stylix.nix # System/CLI/Program theming for ones Noctalia cannot handle
    ./tmux.nix # Terminal multiplexer
    ./vesktop.nix # Discord
    ./yazi.nix # Terminal file manager
    ./niri # Window manager for Wayland (finds ./niri/default.nix automatically)
    ./noctalia # Desktop shell for Wayland
  ];

  #===================================================================
  # USER PACKAGES
  #===================================================================

  home.packages = with pkgs; [
    # Apps
    nautilus # Nautilus GUI file manager
    teams-for-linux # Microsoft Teams client
    vesktop # Discord with better Linux support + Vencord

    # Fonts
    nerd-fonts.jetbrains-mono
    roboto # Noctalia UI font
    inter # Noctalia headers font

    # CLI utilities
    bat # Syntax-highlighted cat
    btop # Better top/htop
    claude-code # Claude CLI
    fzf # Fuzzy finder for interactive searches
    ripgrep # Better grep
    tmux # Terminal multiplexer (multiple terminals in one window)
    tree # Directory tree viewer
    wev # Show keypresses
    wl-clipboard-rs # wl-copy
    yazi # Terminal file manager

    # System utilities
    brightnessctl # Backlight control for laptops

    # Development essentials
    cargo # Rust
    gcc # C/C++ compiler (needed for some builds)
    gh # GitHub command-line tool

    # Cursor
    rose-pine-cursor

    # Niri
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
