# home/programs/noctalia/settings.nix
{...}: {
  # Configuration defaults: https://docs.noctalia.dev/getting-started/nixos/#config-ref
  programs.noctalia-shell = {
    # Configure noctalia here; defaults will
    # be deep merged with these attributes.
    # Additionally, if you use the systemd service,
    # editing the settings with the GUI will show the resulting configuration in
    # ~/.config/noctalia/gui-settings.json
    settings = {
      # Enable theme templates for applications
      templates = {
        gtk = true; # GTK apps (GNOME apps, most Linux apps)
        qt = true; # Qt apps (KDE apps, cross-platform apps)
        alacritty = true; # Alacritty terminal
        firefox = true; # Firefox (requires Pywalfox extension)
        pywalfox = true;
        # helix = true;
        discord = true; # Discord/Vesktop
      };

      # Color scheme
      colorSchemes = {
        useWallpaperColors = false; # Set true if you want colors from wallpaper
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
        generateTemplatesForPredefined = true; # Important for themes
      };

      # General appearance
      general = {
        radiusRatio = 1;
        screenRadiusRatio = 1;
        lockOnSuspend = true;
      };

      # Calendar and location
      location = {
        name = "San Diego, California";
        weatherEnabled = true;
        showCalendarEvents = true;
        use12hourFormat = false;
        firstDayOfWeek = 0; # Sunday = 0, Monday = 1
      };

      # Notification settings
      notifications = {
        enabled = true;
        location = "top_right";
        respectExpireTimeout = false;
      };

      wallpaper = {
        enabled = true; # Enable wallpaper feature
        overviewEnabled = true; # Enable blurred overview wallpaper
        directory = "/home/bree/Pictures/Wallpapers"; # Set  wallpaper directory
        # Or set a default wallpaper:
        # defaultWallpaper = "/etc/nixos/hosts/bree/assets/rose-1.png";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        transitionDuration = 1500;
        transitionType = "random";
      };
    };
  };
}
