# home/programs/niri/applications.nix
# ─── Applications ───
{pkgs}: let
  niri = "${pkgs.niri}/bin/niri";
in {
  terminal = "${pkgs.alacritty}/bin/alacritty"; # Mod+t
  aiTerminal = [
    "${pkgs.alacritty}/bin/alacritty"
    "--working-directory"
    "/etc/nixos"
    "-e"
    "claude"
    "--resume"
  ]; # Mod+Shift+t
  appLauncher = ["noctalia-shell" "ipc" "call" "launcher" "toggle"]; # Mod+a
  browser = "${pkgs.firefox}/bin/firefox"; # Mod+b
  fileManager = "${pkgs.nautilus}/bin/nautilus"; # Mod+Return
  fileManagerTerminal = ["${pkgs.alacritty}/bin/alacritty" "-e" "yazi"]; # Mod+Shift+Return
  lockScreen = ["noctalia-shell" "ipc" "call" "lockScreen" "lock"]; # Mod+l
  nightShift = ["noctalia-shell" "ipc" "call" "darkMode" "toggle"]; # Mod+n
  sessionScreen = ["noctalia-shell" "ipc" "call" "sessionMenu" "toggle"]; # Mod+Shift+l
  systemMonitor = ["${pkgs.alacritty}/bin/alacritty" "-e" "btop"]; # Mod+m
  vesktop = "${pkgs.vesktop}/bin/vesktop"; # Discord client

  # Screenshot commands using niri's built-in IPC
  screenshot = [niri "msg" "action" "screenshot"];
}
