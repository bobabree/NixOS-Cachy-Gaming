# home/programs/niri/keybinds.nix
# https://github.com/YaLTeR/niri/wiki/Configuration:-Key-Bindings
{
  config,
  pkgs,
  ...
}: let
  apps = import ./applications.nix {inherit pkgs;};
in {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    sh = spawn "sh" ["-c"];
  in {
    # =====================================================
    # HOTKEY OVERLAY
    # =====================================================
    "Mod+Shift+Escape".action = show-hotkey-overlay;

    # =====================================================
    # APPLICATIONS
    # =====================================================
    "Mod+t".action = spawn apps.terminal;
    "Mod+Shift+t".action = spawn apps.aiTerminal;

    # "Mod+Space".action = spawn apps.fileManager;
    "Mod+a".action = spawn apps.appLauncher;
    "Mod+b".action = spawn apps.browser;
    "Mod+l".action = spawn apps.lockScreen;
    "Mod+Shift+l".action = spawn apps.sessionScreen;
    "Mod+m".action = spawn apps.systemMonitor;
    "Mod+q".action = close-window;
    # =====================================================
    # AUDIO CONTROLS
    # =====================================================
    "xf86audioraisevolume" = {
      action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
      allow-when-locked = true;
    };
    "xf86audiolowervolume" = {
      action = sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
      allow-when-locked = true;
    };
    "xf86audiomute" = {
      action = sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      allow-when-locked = true;
    };
    "xf86audiomicmute" = {
      action = sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      allow-when-locked = true;
    };

    # Media controls
    "xf86audionext" = {
      action = sh "playerctl next";
      allow-when-locked = true;
    };
    "xf86audiopause" = {
      action = sh "playerctl play-pause";
      allow-when-locked = true;
    };
    "xf86audioplay" = {
      action = sh "playerctl play-pause";
      allow-when-locked = true;
    };
    "xf86audioprev" = {
      action = sh "playerctl previous";
      allow-when-locked = true;
    };

    # =====================================================
    # BRIGHTNESS CONTROLS
    # =====================================================
    "xf86monbrightnessup" = {
      action = sh "brightnessctl set 10%+";
      allow-when-locked = true;
    };
    "xf86monbrightnessdown" = {
      action = sh "brightnessctl set 10%-";
      allow-when-locked = true;
    };

    # =====================================================
    # WINDOW MANAGEMENT
    # =====================================================
    "Mod+f".action = maximize-column;
    "Mod+Shift+f".action = fullscreen-window;
    "Mod+w".action = toggle-column-tabbed-display;
    "Mod+v".action = switch-focus-between-floating-and-tiling;
    "Mod+Shift+v".action = toggle-window-floating;

    # Column management
    "Mod+c".action = center-column;
    "Mod+r".action = switch-preset-column-width;
    "Mod+comma".action = consume-window-into-column;
    "Mod+period".action = expel-window-from-column;

    # =====================================================
    # SCREENSHOTS
    # =====================================================
    "control+shift+1".action.screenshot = [];
    "control+shift+2".action.screenshot-screen = [];
    "control+shift+3".action.screenshot-window = [];
    "Print".action.screenshot-screen = [];
    "Mod+Print".action.screenshot-window = [];

    # =====================================================
    # DYNAMIC CASTING (for presentations/streaming)
    # =====================================================
    "Mod+Insert".action = set-dynamic-cast-window;
    "Mod+Shift+Insert".action = set-dynamic-cast-monitor;
    "Mod+Delete".action = clear-dynamic-cast-target;

    # =====================================================
    # WINDOW FOCUS (ARROWS)
    # =====================================================
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Up".action = focus-workspace-up;
    "Mod+Down".action = focus-workspace-down;

    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;

    "Mod+Tab".action = focus-window-down-or-column-right;
    "Mod+Shift+Tab".action = focus-window-up-or-column-left;

    # =====================================================
    # WINDOW MOVEMENT (CTRL + ARROWS)
    # =====================================================
    "Mod+Control+Left".action = move-column-left-or-to-monitor-left;
    "Mod+Control+Right".action = move-column-right-or-to-monitor-right;
    "Mod+Control+Up".action = move-window-up-or-to-workspace-up;
    "Mod+Control+Down".action = move-window-down-or-to-workspace-down;

    "Mod+Control+Home".action = move-column-to-first;
    "Mod+Control+End".action = move-column-to-last;

    # =====================================================
    # MONITOR FOCUS
    # =====================================================
    "Mod+Shift+Left".action = focus-monitor-left;
    "Mod+Shift+Right".action = focus-monitor-right;
    "Mod+Shift+Up".action = focus-monitor-up;
    "Mod+Shift+Down".action = focus-monitor-down;

    # =====================================================
    # MOVE WINDOW TO MONITOR
    # =====================================================
    "Mod+Shift+Control+Left".action = move-window-to-monitor-left;
    "Mod+Shift+Control+Right".action = move-window-to-monitor-right;
    "Mod+Shift+Control+Up".action = move-window-to-monitor-up;
    "Mod+Shift+Control+Down".action = move-window-to-monitor-down;

    # =====================================================
    # WORKSPACE SWITCHING (MOUSE)
    # =====================================================
    # Use Touchpad instead of Wheel for laptops
    "Mod+WheelScrollDown" = {
      action = focus-workspace-down;
      cooldown-ms = 150;
    };
    "Mod+WheelScrollUp" = {
      action = focus-workspace-up;
      cooldown-ms = 150;
    };
    "Mod+Control+WheelScrollDown" = {
      action = move-window-to-workspace-down;
      cooldown-ms = 150;
    };
    "Mod+Control+WheelScrollUp" = {
      action = move-window-to-workspace-up;
      cooldown-ms = 150;
    };

    "Mod+WheelScrollRight".action = focus-column-right;
    "Mod+WheelScrollLeft".action = focus-column-left;
    "Mod+Control+WheelScrollRight".action = move-column-right;
    "Mod+Control+WheelScrollLeft".action = move-column-left;

    "Mod+Shift+WheelScrollDown".action = focus-column-right;
    "Mod+Shift+WheelScrollUp".action = focus-column-left;
    "Mod+Control+Shift+WheelScrollDown".action = move-column-right;
    "Mod+Control+Shift+WheelScrollUp".action = move-column-left;

    # =====================================================
    # LAYOUT CONTROLS
    # =====================================================
    "Mod+Control+f".action = expand-column-to-available-width;
    "Mod+Control+c".action = center-visible-columns;
    "Mod+minus".action = set-column-width "-10%";
    "Mod+equal".action = set-column-width "+10%";
    "Mod+Shift+minus".action = set-window-height "-10%";
    "Mod+Shift+equal".action = set-window-height "+10%";

    # =====================================================
    # OVERVIEW
    # =====================================================
    "Mod+o" = {
      action = toggle-overview;
      repeat = false;
    };

    # =====================================================
    # EMERGENCY & POWER
    # =====================================================
    "Mod+Escape" = {
      # Use this when a fullscreen app blocks your keybinds.
      action = toggle-keyboard-shortcuts-inhibit;
      allow-inhibiting = false;
    };
    "control+alt+Delete".action = quit;
    "Mod+Shift+e".action = quit;
    "Mod+Shift+p".action = power-off-monitors;

    # =====================================================
    # DEBUG
    # =====================================================
    "Mod+Shift+Control+t".action = toggle-debug-tint;
  };
}
