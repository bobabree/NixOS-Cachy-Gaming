# home/programs/default.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  # Import all user program configurations
  imports = [
    ./alacritty.nix # Terminal emulator config
    ./helix.nix # Text editor config
    ./firefox.nix # Browser config
    ./fish.nix # Shell config
    ./git.nix # Version control config
    ./niri # Window manager for Wayland (finds ./niri/default.nix automatically)
    ./noctalia # Desktop shell for Wayland
  ];

  #===================================================================
  # USER PACKAGES
  #===================================================================

  home.packages = with pkgs; [
    # Apps
    teams-for-linux # Microsoft Teams client

    # Fonts
    nerd-fonts.jetbrains-mono
    roboto # Noctalia UI font
    inter # Noctalia headers font

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

    # Niri
    xwayland-satellite

    # Noctalia
    gpu-screen-recorder # Screen recording functionality
    # ddcutil # Desktop monitor brightness control (⚠️ may introduce system instability with certain monitors)
    cliphist # Clipboard history support
    matugen # Material You color scheme generation
    cava # Audio visualizer component
    wlsunset # Night light functionality
    xdg-desktop-portal # Enables “Portal” option in screen recorder
    python3 # Calendar events
    evolution-data-server # Calendar events
    adw-gtk3 # GTK theme base
    qt6Packages.qt6ct # Qt configuration tool
    pywalfox-native # Enable firefox theming
  ];

  # Force overwrite all conflicts - no backups
  home.activation.forceOverwrite = lib.hm.dag.entryBefore ["writeBoundary"] ''
    $DRY_RUN_CMD rm -rf $HOME/.local/state/home-manager
  '';

  # Create symlink for pywalfox
  home.file.".cache/wal/colors.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/noctalia/colors.json";

  #===================================================================
  # GTK THEMING
  # Base theme that Noctalia will customize with generated colors
  #===================================================================
  gtk = {
    enable = true;

    # Base GTK theme - Noctalia will inject colors via CSS
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    # Icon theme
    # This won't change with Noctalia's colors
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # Cursor theme - matches Niri
    cursorTheme = {
      name = "BreezeX-RosePineDawn-Linux";
      package = pkgs.rose-pine-cursor;
      size = 36;
    };

    # Font for GTK applications
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  #===================================================================
  # DCONF SETTINGS
  # Controls GTK4/libadwaita app behavior and color scheme
  #===================================================================
  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface" = {
      # "default" = follow Noctalia's dark/light mode switching
      color-scheme = "default";

      # Font rendering (optional but improves appearance)
      font-antialiasing = "rgba";
      font-hinting = "slight";
    };
  };

  #===================================================================
  # QT THEMING
  # Themes Qt applications using qt6ct
  #===================================================================
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  #===================================================================
  # DEFAULT APPLICATIONS
  # Set which apps open which file types
  #===================================================================
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Web browser defaults
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

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
