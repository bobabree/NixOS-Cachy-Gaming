# home/programs/niri/keybinds.nix
{...}: {
  programs.niri.settings.binds = {
    "Mod+Return".action.spawn = ["alacritty"];
    "Super+Return".action.spawn = ["alacritty"];
    # "Mod+Q".action = close-window;
  };
}
