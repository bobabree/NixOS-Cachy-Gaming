# home/programs/niri/applications.nix
{
  pkgs,
  config,
}: let
  niri = "${pkgs.niri}/bin/niri";
  noctalia = "${config.programs.noctalia-shell.package}/bin/noctalia-shell";
in {
  aiTerminal = [
    "${pkgs.alacritty}/bin/alacritty"
    "--working-directory"
    "/etc/nixos"
    "-e"
    "claude"
    "--resume"
  ];
  appLauncher = [noctalia "ipc" "call" "launcher" "toggle"];
  browser = "${pkgs.firefox}/bin/firefox";
  chat = "${pkgs.vesktop}/bin/vesktop";
  desktopShell = [noctalia];
  fileManager = "${pkgs.nautilus}/bin/nautilus";
  fileManagerTerminal = ["${pkgs.alacritty}/bin/alacritty" "-e" "yazi"];
  lockScreen = [noctalia "ipc" "call" "lockScreen" "lock"];
  nightShift = [noctalia "ipc" "call" "darkMode" "toggle"];
  screenshot = [niri "msg" "action" "screenshot"];
  sessionScreen = [noctalia "ipc" "call" "sessionMenu" "toggle"];
  systemMonitor = ["${pkgs.alacritty}/bin/alacritty" "-e" "btop"];
  terminal = "${pkgs.alacritty}/bin/alacritty";
}
