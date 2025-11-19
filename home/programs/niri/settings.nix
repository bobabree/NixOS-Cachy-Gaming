# home/programs/niri/settings.nix
{pkgs, ...}: {
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      workspaces = {
        "browser" = {};
        "vesktop" = {};
      };

      # Disable program decorations
      prefer-no-csd = true;
      # Screenshot saving
      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H-%M-%S.png";

      hotkey-overlay = {
        skip-at-startup = true;
      };

      cursor = {
        size = 30;
        theme = "Adwaita";
      };
    };
  };
}
