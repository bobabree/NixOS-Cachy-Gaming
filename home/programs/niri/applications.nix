# home/programs/niri/applications.nix
# ─── Applications ───
{pkgs}: let
  niri = "${pkgs.niri}/bin/niri";
in {
  # appLauncher = "${pkgs.walker}/bin/walker"; # Mod+a
  browser = "${pkgs.firefox}/bin/firefox"; # Mod+b
  # fileManager = "${pkgs.xfce.thunar}/bin/thunar"; Mod+space
  # lockScreen = "{pkgs.}/bin/"; Mod+l
  terminal = "${pkgs.alacritty}/bin/alacritty"; # Mod+t

  # Screenshot commands using niri's built-in IPC
  screenshot = [niri "msg" "action" "screenshot"];
}
