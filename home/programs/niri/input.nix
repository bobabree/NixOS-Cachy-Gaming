# home/programs/niri/input.nix
# ────────────── Input Configuration ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Input
{...}: {
  programs.niri.settings = {
    input = {
      # ═══════════════════════════════════════════════════════════
      # KEYBOARD
      # ═══════════════════════════════════════════════════════════
      keyboard = {
        xkb = {
          layout = "us"; # Keyboard layout (us, uk, de, fr, etc.)
          # variant = "colemak_dh_ortho"; # Layout variant (uncomment if using alternative layout)
          # options = "ctrl:nocaps"; # Make Caps Lock act as Ctrl (useful for programmers)
        };

        # Milliseconds before key repeat starts when held down
        # repeat-delay = 300; # Default: 600, Range: lower = faster initial repeat

        # Characters per second when key is held
        # repeat-rate = 35; # Default: 25, Range: higher = faster repeat

        # Keyboard layout tracking: "global" (one layout for all windows) or "window" (per-window)
        track-layout = "global";

        # Enable Num Lock on startup (disable if laptop has Num Lock overlay on regular keys)
        # numlock = true;
      };

      # ═══════════════════════════════════════════════════════════
      # TOUCHPAD
      # ═══════════════════════════════════════════════════════════
      touchpad = {
        # tap = true; # Enable tap-to-click (finger tap = click)
        tap = true;

        # dwt = true; # Disable-while-typing: ignore touchpad input while typing
        dwt = true;

        # dwtp = true; # Disable-while-trackpointing (for ThinkPad trackpoint users)
        # dwtp = false; # You don't have a trackpoint

        # drag = true; # Enable tap-and-drag (tap, hold, move = drag files/windows)
        # drag = true; # Default: true (useful, leave enabled)

        # drag-lock = true; # Keep dragging after lifting finger until next tap
        # drag-lock = false; # Default: false (can be confusing)

        # natural-scroll = true; # Reverse scroll direction (macOS/mobile style)
        natural-scroll = true; # Two-finger down = scroll down content (natural)

        # accel-speed = 0.2; # Pointer speed: -1.0 (slowest) to 1.0 (fastest)
        # accel-speed = 0.2; # Default: 0.0, Recommended: 0.0 to 0.3

        # accel-profile = "adaptive"; # Cursor acceleration: "adaptive" or "flat"
        accel-profile = "adaptive"; # adaptive = faster when moving quickly (natural feel)

        # scroll-factor = 1.0; # Scroll speed multiplier
        # scroll-factor = 1.0; # Default: 1.0 (increase if scrolling feels slow)

        # scroll-method = "two-finger"; # Scroll method: "two-finger", "edge", "on-button-down"
        scroll-method = "two-finger"; # Most common on modern touchpads

        # tap-button-map = "left-right-middle"; # What 1/2/3 finger taps do
        # tap-button-map = "left-right-middle"; # 1-tap=left, 2-tap=right, 3-tap=middle

        # click-method = "clickfinger"; # Physical click behavior
        # "button-areas": bottom-left=left click, bottom-right=right click
        # "clickfinger": 1-finger=left, 2-finger=right, 3-finger=middle (macOS-like)
        click-method = "clickfinger"; # Works anywhere on touchpad

        # middle-emulation = true; # Left+Right click simultaneously = middle click
        middle-emulation = true; # Useful fallback for middle click

        # disabled-on-external-mouse = true; # Disable touchpad when mouse plugged in
        # disabled-on-external-mouse = false; # Leave enabled unless you prefer auto-disable

        # left-handed = true; # Swap left/right buttons for left-handed users
        # left-handed = false;
      };

      # ═══════════════════════════════════════════════════════════
      # MOUSE (external mouse settings)
      # ═══════════════════════════════════════════════════════════
      mouse = {
        # natural-scroll = true; # Reverse scroll direction
        # accel-speed = 0.0; # Mouse pointer speed
        # accel-profile = "flat"; # Disable acceleration (more precise for gaming)
        # left-handed = false;
        # middle-emulation = true;
      };

      # ═══════════════════════════════════════════════════════════
      # TABLET & TOUCH (for touchscreen/stylus)
      # ═══════════════════════════════════════════════════════════
      tablet = {
        map-to-output = "eDP-1"; # Map tablet/stylus to your laptop screen
      };

      touch = {
        map-to-output = "eDP-1"; # Map touchscreen to your laptop screen
      };

      # ═══════════════════════════════════════════════════════════
      # GENERAL INPUT SETTINGS
      # ═══════════════════════════════════════════════════════════

      # disable-power-key-handling = true; # Let systemd handle power button instead

      # warp-mouse-to-focus = { enable = true; }; # Move cursor to newly focused window
      # warp-mouse-to-focus = { enable = true; mode = "center-xy"; }; # Always center cursor
      warp-mouse-to-focus.enable = false; # Can be disorienting

      # focus-follows-mouse = { enable = true; max-scroll-amount = "0%"; };
      # Focus window under mouse without clicking
      # max-scroll-amount = "0%" means only focus if no scrolling needed
      focus-follows-mouse.enable = true;
      focus-follows-mouse.max-scroll-amount = "0%";

      # workspace-auto-back-and-forth = true; # Press workspace key twice = go to previous workspace
      # workspace-auto-back-and-forth = false; # Useful for toggling between 2 workspaces
    };
  };
}
