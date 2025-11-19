# home/programs/niri/applications.nix
{pkgs}: let
  niri = "${pkgs.niri}/bin/niri";
in {
  browser = "${pkgs.firefox}/bin/firefox";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  # fileManager = "${pkgs.xfce.thunar}/bin/thunar";
  # appLauncher = "${pkgs.walker}/bin/walker";

  # Screenshot commands using niri's built-in IPC
  screenshot = [niri "msg" "action" "screenshot"];
  screenshot-window = [niri "msg" "action" "screenshot-window"];
  screenshot-screen = [niri "msg" "action" "screenshot-screen"];
}
