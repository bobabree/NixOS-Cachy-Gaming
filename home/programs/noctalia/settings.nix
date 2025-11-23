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
        alacritty = false;
        discord = true; # Discord/Vesktop
        vesktop = true;
        vencord = true;
        firefox = true; # Firefox (requires Pywalfox extension)
        pywalfox = true;
        gtk = false;
        qt = false;
      };

      # Color scheme
      colorSchemes = {
        useWallpaperColors = false; # Set true if you want colors from wallpaper
        predefinedScheme = "Rosepine";
        # darkMode = true;
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
        directory = "/etc/nixos/hosts/bree/assets"; # Set  wallpaper directory
        defaultWallpaper = "/etc/nixos/hosts/bree/assets/1.jpg";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        transitionDuration = 1500;
        transitionType = "random";
      };
    };
  };
}
