# home/programs/niri/settings.nix
{pkgs, ...}: {
  programs.niri = {
    package = pkgs.niri;
    settings = {
      # REQUIRED: Allow Noctalia notification actions and window activation
      debug = {
        honor-xdg-activation-with-invalid-serial = {};
      };

      workspaces = {
        "browser" = {};
        "vesktop" = {};
      };

      # Disable program decorations
      prefer-no-csd = true;
      # Screenshot saving
      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";

      clipboard = {
        disable-primary = true; # disable middle-click paste
      };

      config-notification = {
        disable-failed = false;
      };

      cursor = {
        hide-when-typing = false;
        # hide-after-inactive-ms = 1000;
        size = 36;
        theme = "BreezeX-RosePineDawn-Linux";
      };

      hotkey-overlay = {
        skip-at-startup = true;
        # hide-not-bound = false;
      };

      overview = {
        zoom = 0.75; # Control how much the workspaces zoom out in the overview.
        # backdrop-color = "#26233a";
        workspace-shadow = {
          enable = false; # off?
          softness = 40;
          spread = 10;
          offset = {
            x = 0;
            y = 0;
          };
          color = "#00000050";
        };
      };

      xwayland-satellite = {
        enable = true;
        path = "xwayland-satellite";
      };
    };
  };
}
