# home/programs/niri/applications.nix
# ─── Applications ───
{pkgs}: let
  niri = "${pkgs.niri}/bin/niri";
in {
  aiTerminal = ["${pkgs.alacritty}/bin/alacritty" "-e" "claude" "chat"];
  appLauncher = ["noctalia-shell" "ipc" "call" "launcher" "toggle"]; # Mod+a
  browser = "${pkgs.firefox}/bin/firefox"; # Mod+b
  lockScreen = ["noctalia-shell" "ipc" "call" "lockScreen" "lock"]; # Mod+l
  sessionScreen = ["noctalia-shell" "ipc" "call" "sessionMenu" "toggle"]; # Mod+Shift+l
  systemMonitor = ["${pkgs.alacritty}/bin/alacritty" "-e" "btop"]; # Mod+m
  terminal = "${pkgs.alacritty}/bin/alacritty"; # Mod+t
  vesktop = "${pkgs.vesktop}/bin/vesktop"; # Discord client

  # Screenshot commands using niri's built-in IPC
  screenshot = [niri "msg" "action" "screenshot"];
}
