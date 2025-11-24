# home/programs/noctalia/settings.nix
{...}: {
  programs.noctalia-shell = {
    settings = {
      # ═══════════════════════════════════════════════════════════
      # SETUP & VERSION
      # ═══════════════════════════════════════════════════════════

      # settingsVersion = 23; # Internal version, managed automatically
      # setupCompleted = false; # Show setup wizard on first launch

      # ═══════════════════════════════════════════════════════════
      # BAR CONFIGURATION
      # ═══════════════════════════════════════════════════════════

      bar = {
        position = "top"; # "top" | "bottom" | "left" | "right"
        density = "default"; # "mini" | "compact" | "default" | "comfortable"

        # Appearance
        backgroundOpacity = 0.95; # 0.0-1.0
        showCapsule = true; # Show widget background capsules
        capsuleOpacity = 0.95; # 0.0-1.0

        # Floating bar settings
        floating = false; # Detach bar from screen edge
        marginVertical = 0.25; # Gap from top/bottom when floating (%)
        marginHorizontal = 0.25; # Gap from left/right when floating (%)
        outerCorners = true; # Round outer corners when floating

        # Layout
        exclusive = true; # Reserve space (don't overlap windows)
        monitors = []; # Empty = all monitors, or ["DP-1" "HDMI-1"]

        # Widget layout (left/center/right sections)
        widgets = {
          left = [
            {id = "ControlCenter";}
            {id = "SystemMonitor";}
            {id = "ActiveWindow";}
            {id = "MediaMini";}
          ];
          center = [
            {id = "Workspace";}
          ];
          right = [
            {id = "ScreenRecorder";}
            {id = "Tray";}
            {id = "NotificationHistory";}
            {id = "Battery";}
            {id = "Volume";}
            {id = "Brightness";}
            {id = "Clock";}
          ];
        };
      };

      # ═══════════════════════════════════════════════════════════
      # GENERAL SETTINGS
      # ═══════════════════════════════════════════════════════════

      general = {
        # User profile
        avatarImage = "/etc/nixos/hosts/bree/assets/Avatars/avatar.jpg"; # Path to avatar image for lock screen

        # Visual settings
        scaleRatio = 1; # Global UI scale: 0.8-1.2 (80%-120%)
        radiusRatio = 1; # Border radius multiplier
        screenRadiusRatio = 1; # Screen corner radius multiplier
        animationSpeed = 1; # Animation speed multiplier
        animationDisabled = false; # Disable all animations

        # Shadows
        enableShadows = true;
        shadowDirection = "bottom_right"; # "top_left" | "top_right" | "bottom_left" | "bottom_right"
        shadowOffsetX = 2; # Horizontal shadow offset (px)
        shadowOffsetY = 3; # Vertical shadow offset (px)

        # Screen
        dimmerOpacity = 0.6; # Lock screen dimmer opacity (0.0-1.0)
        showScreenCorners = false; # Show colored screen corner indicators
        forceBlackScreenCorners = false; # Force black corners (fixes some display issues)

        # Lock screen
        compactLockScreen = false; # Compact lock screen layout
        lockOnSuspend = true; # Lock when system suspends
        showHibernateOnLockScreen = false; # Show hibernate button

        # Misc
        language = ""; # UI language ("" = auto-detect, "en", "de", "fr", etc.)
        allowPanelsOnScreenWithoutBar = true; # Show panels on monitors without bar
      };

      # ═══════════════════════════════════════════════════════════
      # UI SETTINGS
      # ═══════════════════════════════════════════════════════════

      ui = {
        # Fonts
        fontDefault = "Roboto"; # Default UI font
        fontFixed = "DejaVu Sans Mono"; # Monospace font
        fontDefaultScale = 1; # Default font size multiplier
        fontFixedScale = 1; # Monospace font size multiplier

        # Panels
        tooltipsEnabled = true; # Show tooltips
        panelBackgroundOpacity = 0.95; # Panel background opacity (0.0-1.0)
        panelsAttachedToBar = true; # Attach panels to bar edge
        settingsPanelAttachToBar = false; # Attach settings panel to bar
      };

      # ═══════════════════════════════════════════════════════════
      # LOCATION & CALENDAR
      # ═══════════════════════════════════════════════════════════

      location = {
        name = "San Diego, California"; # City name for weather

        # Weather
        weatherEnabled = true; # Enable weather widget
        weatherShowEffects = true; # Show weather effects (rain/snow)
        useFahrenheit = true; # Use Fahrenheit (false = Celsius)

        # Time & Calendar
        use12hourFormat = true; # 12-hour time format
        firstDayOfWeek = -1; # 0=Sunday, 1=Monday, -1=locale default
        showWeekNumberInCalendar = false; # Show ISO week numbers
        showCalendarEvents = true; # Show calendar events
        showCalendarWeather = true; # Show weather in calendar
        analogClockInCalendar = false; # Analog clock in calendar
      };

      # ═══════════════════════════════════════════════════════════
      # SCREEN RECORDER
      # ═══════════════════════════════════════════════════════════

      screenRecorder = {
        directory = ""; # Save location ("" = ~/Videos)
        frameRate = 60; # Recording frame rate
        quality = "very_high"; # "low" | "medium" | "high" | "very_high" | "ultra"

        # Codecs
        videoCodec = "h264"; # "auto" | "h264" | "h264_vaapi" | "hevc" | "hevc_vaapi" | "av1" | "vp8" | "vp9"
        audioCodec = "opus"; # "opus" | "aac" | "flac"
        colorRange = "limited"; # "limited" | "full"

        # Sources
        videoSource = "portal"; # "portal" | "screen" | "focused_monitor" | "focused_window"
        audioSource = "default_output"; # "default_output" | "default_input" | "default_output_and_input"
        showCursor = true; # Record mouse cursor
      };

      # ═══════════════════════════════════════════════════════════
      # WALLPAPER
      # ═══════════════════════════════════════════════════════════

      wallpaper = {
        enabled = true; # Enable wallpaper management
        overviewEnabled = true; # Blurred wallpaper in overview/workspace switcher

        # Directories
        directory = "~/Pictures/Wallpapers"; # Wallpaper folder
        enableMultiMonitorDirectories = false; # Per-monitor wallpaper folders
        recursiveSearch = false; # Search subdirectories

        # Display
        setWallpaperOnAllMonitors = true; # Same wallpaper on all monitors
        defaultWallpaper = "/etc/nixos/hosts/bree/assets/Wallpapers/1.jpg"; # Default image
        fillMode = "crop"; # "crop" | "fill" | "fit" | "stretch" | "tile" | "center"
        fillColor = "#000000"; # Background color for non-filled areas

        # Slideshow
        randomEnabled = false; # Auto-change wallpaper
        randomIntervalSec = 120; # Change interval (seconds)

        # Transitions
        transitionDuration = 1500; # Transition duration (ms)
        transitionType = "random"; # "random" | "fade" | "slide_left" | "slide_right" | "slide_up" | "slide_down"
        transitionEdgeSmoothness = 0.05; # Transition smoothing (0.0-1.0)

        # UI
        panelPosition = "follow_bar"; # "follow_bar" | "top" | "bottom" | "left" | "right" | "center"
        hideWallpaperFilenames = false; # Hide filenames in selector
        monitors = []; # Per-monitor wallpapers (advanced)

        # Wallhaven integration
        useWallhaven = true; # Enable Wallhaven API
        wallHavenApiKey = "wsvo1KnIb12rJHKpmCRtTcWYrLgA9Zao";
        wallhavenQuery = "makima"; # Search query
        wallhavenSorting = "favorites"; # "relevance" | "random" | "date_added" | "views" | "favorites"
        wallhavenOrder = "desc"; # "desc" | "asc"
        wallhavenCategories = "111"; # "general,anime,people" (1=enabled, 0=disabled)
        wallhavenPurity = "100"; # "sfw,sketchy,nsfw" (1=enabled, 0=disabled)
        wallhavenResolutionMode = "atleast"; # "atleast" | "exactly"
        wallhavenResolutionWidth = "1440"; # Minimum/exact width
        wallhavenResolutionHeight = "900"; # Minimum/exact height
      };

      # ═══════════════════════════════════════════════════════════
      # APPLICATION LAUNCHER
      # ═══════════════════════════════════════════════════════════

      appLauncher = {
        position = "center"; # "center" | "top" | "bottom"

        # Clipboard
        enableClipboardHistory = true; # Show clipboard history
        enableClipPreview = true; # Preview clipboard items

        # Applications
        pinnedExecs = ["firefox" "alacritty" "nautilus" "vesktop"]; # Pinned app executables ["firefox" "alacritty"]
        sortByMostUsed = true; # Sort by usage frequency
        useApp2Unit = false; # Use systemd app2unit for launching

        # Terminal
        terminalCommand = "alacritty -e"; # Terminal emulator command
        customLaunchPrefixEnabled = false; # Custom launch wrapper
        customLaunchPrefix = ""; # Launch prefix command
      };

      # ═══════════════════════════════════════════════════════════
      # CONTROL CENTER
      # ═══════════════════════════════════════════════════════════

      controlCenter = {
        position = "close_to_bar_button"; # "close_to_bar_button" | "center" | "top_right" | "top_left" | "bottom_right" | "bottom_left"

        # Quick action shortcuts
        shortcuts = {
          left = [
            {id = "WiFi";}
            {id = "Bluetooth";}
            {id = "ScreenRecorder";}
            {id = "WallpaperSelector";}
          ];
          right = [
            {id = "Notifications";}
            {id = "PowerProfile";}
            {id = "KeepAwake";}
            {id = "NightLight";}
          ];
        };

        # Cards (can be reordered/disabled)
        cards = [
          {
            id = "profile-card";
            enabled = true;
          }
          {
            id = "shortcuts-card";
            enabled = true;
          }
          {
            id = "audio-card";
            enabled = true;
          }
          {
            id = "weather-card";
            enabled = true;
          }
          {
            id = "media-sysmon-card";
            enabled = true;
          }
        ];
      };

      # ═══════════════════════════════════════════════════════════
      # SYSTEM MONITOR
      # ═══════════════════════════════════════════════════════════

      systemMonitor = {
        # Warning thresholds (%)
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;

        # Custom colors
        useCustomColors = false;
        warningColor = ""; # Hex color for warning state
        criticalColor = ""; # Hex color for critical state
      };

      # ═══════════════════════════════════════════════════════════
      # DOCK
      # ═══════════════════════════════════════════════════════════

      dock = {
        enabled = false; # Enable application dock
        displayMode = "always_visible"; # "always_visible" | "autohide" | "intellihide"

        # Appearance
        backgroundOpacity = 0.95; # 0.0-1.0
        radiusRatio = 0.1; # Border radius multiplier
        floatingRatio = 1; # Floating offset multiplier
        size = 1; # Icon size multiplier
        colorizeIcons = false; # Match icons to theme colors

        # Layout
        monitors = []; # Show on specific monitors ([] = all)
        onlySameOutput = true; # Only show apps on same monitor
        pinnedApps = []; # Pinned applications ["firefox.desktop"]
      };

      # ═══════════════════════════════════════════════════════════
      # NETWORK
      # ═══════════════════════════════════════════════════════════

      network = {
        wifiEnabled = true; # Enable WiFi controls
      };

      # ═══════════════════════════════════════════════════════════
      # SESSION MENU
      # ═══════════════════════════════════════════════════════════

      sessionMenu = {
        position = "center"; # "center" | "top" | "bottom"
        showHeader = true; # Show menu header

        # Countdown
        enableCountdown = true; # Confirmation countdown for actions
        countdownDuration = 10000; # Countdown duration (ms)

        # Available power options
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = true;
          }
          {
            action = "hibernate";
            enabled = true;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
      };

      # ═══════════════════════════════════════════════════════════
      # NOTIFICATIONS
      # ═══════════════════════════════════════════════════════════

      notifications = {
        enabled = true;
        location = "top_right"; # "top_left" | "top_center" | "top_right" | "bottom_left" | "bottom_center" | "bottom_right"
        monitors = []; # Show on specific monitors ([] = all)

        # Appearance
        overlayLayer = true; # Show above other windows
        backgroundOpacity = 0.95; # 0.0-1.0

        # Timing
        respectExpireTimeout = false; # Honor app-specified timeout
        lowUrgencyDuration = 3; # Low urgency timeout (seconds)
        normalUrgencyDuration = 8; # Normal urgency timeout (seconds)
        criticalUrgencyDuration = 15; # Critical urgency timeout (seconds)

        # Features
        enableKeyboardLayoutToast = true; # Show keyboard layout changes
      };

      # ═══════════════════════════════════════════════════════════
      # OSD (ON-SCREEN DISPLAY)
      # ═══════════════════════════════════════════════════════════

      osd = {
        enabled = true;
        location = "top_right"; # "top_left" | "top_center" | "top_right" | "bottom_left" | "bottom_center" | "bottom_right"
        monitors = []; # Show on specific monitors ([] = all)
        autoHideMs = 2000; # Auto-hide after (ms)
        overlayLayer = true; # Show above other windows
        backgroundOpacity = 0.95; # 0.0-1.0
      };

      # ═══════════════════════════════════════════════════════════
      # AUDIO
      # ═══════════════════════════════════════════════════════════

      audio = {
        volumeStep = 5; # Volume change increment (%)
        volumeOverdrive = false; # Allow volume >100%

        # Visualizer
        cavaFrameRate = 30; # Visualizer frame rate
        visualizerType = "linear"; # "linear" | "circular"
        visualizerQuality = "high"; # "low" | "medium" | "high"

        # MPRIS (media player control)
        mprisBlacklist = []; # Blacklist players ["firefox" "chrome"]
        preferredPlayer = ""; # Preferred player ("" = auto)
        externalMixer = "pwvucontrol || pavucontrol"; # External mixer command
      };

      # ═══════════════════════════════════════════════════════════
      # BRIGHTNESS
      # ═══════════════════════════════════════════════════════════

      brightness = {
        brightnessStep = 1; # Brightness change increment (%)
        enforceMinimum = true; # Enforce minimum brightness
        enableDdcSupport = false; # Enable DDC/CI for external monitors (experimental)
      };

      # ═══════════════════════════════════════════════════════════
      # COLOR SCHEMES
      # ═══════════════════════════════════════════════════════════

      colorSchemes = {
        # Source
        useWallpaperColors = false; # Generate colors from wallpaper
        predefinedScheme = "Rosepine"; # Predefined scheme name

        # Mode
        darkMode = true; # Dark mode enabled
        schedulingMode = "off"; # "off" | "sunset" | "manual"
        manualSunrise = "06:30"; # Manual sunrise time (HH:MM)
        manualSunset = "18:30"; # Manual sunset time (HH:MM)

        # Generation
        matugenSchemeType = "scheme-fruit-salad"; # Matugen algorithm
        # Options: "scheme-content" | "scheme-expressive" | "scheme-fidelity" | "scheme-fruit-salad" |
        #          "scheme-monochrome" | "scheme-neutral" | "scheme-rainbow" | "scheme-tonal-spot" | "scheme-vibrant"
        generateTemplatesForPredefined = true; # Generate app templates for predefined schemes
      };

      # ═══════════════════════════════════════════════════════════
      # APPLICATION TEMPLATES
      # ═══════════════════════════════════════════════════════════

      templates = {
        # Terminal emulators
        alacritty = false; # Stylix handles this
        kitty = false;
        ghostty = false;
        foot = false;
        wezterm = false;

        # Desktop theming
        gtk = false; # Stylix handles this
        qt = false; # Stylix handles this
        kcolorscheme = false; # KDE color scheme

        # Applications
        discord = true; # Discord/Vesktop theming
        pywalfox = true; # Firefox via Pywalfox
        code = false; # VS Code
        spicetify = false; # Spotify
        telegram = false; # Telegram

        # Launchers
        fuzzel = false; # Fuzzel launcher
        walker = false; # Walker launcher
        vicinae = false; # Vicinae launcher

        # Custom
        enableUserTemplates = false; # Enable user-defined templates
      };

      # ═══════════════════════════════════════════════════════════
      # NIGHT LIGHT
      # ═══════════════════════════════════════════════════════════

      nightLight = {
        enabled = false; # Enable night light
        forced = false; # Force night light on
        autoSchedule = true; # Auto schedule based on location
        nightTemp = "4000"; # Night temperature (K)
        dayTemp = "6500"; # Day temperature (K)
        manualSunrise = "06:30"; # Manual sunrise (HH:MM)
        manualSunset = "18:30"; # Manual sunset (HH:MM)
      };

      # ═══════════════════════════════════════════════════════════
      # HOOKS (CUSTOM SCRIPTS)
      # ═══════════════════════════════════════════════════════════

      hooks = {
        enabled = false; # Enable hook scripts
        wallpaperChange = ""; # Script to run on wallpaper change
        darkModeChange = ''
          #!/usr/bin/env fish

          # Notify start
          notify-send "Theme Switching" "Changing to $argv[1] mode..." -u low

          if test "$argv[1]" = "dark"
            set scheme "rose-pine"
          else
            set scheme "rose-pine-dawn"
          end

          # Update stylix
          sed -i "s|base16-schemes}/share/themes/.*\\.yaml|base16-schemes}/share/themes/$scheme.yaml|" /etc/nixos/hosts/bree/system/programs/stylix.nix

          # Notify rebuild starting
          notify-send "Theme Switching" "Rebuilding system with $scheme..." -u low

          # Rebuild (background so UI doesn't hang)
          sudo nixos-rebuild switch --flake /etc/nixos#bree &

          # Notify completion
          notify-send "Theme Switched" "Now using $scheme theme" -u low
        '';
      };

      # ═══════════════════════════════════════════════════════════
      # CHANGELOG
      # ═══════════════════════════════════════════════════════════

      # changelog.lastSeenVersion = ""; # Last seen changelog version (managed automatically)
    };
  };
}
