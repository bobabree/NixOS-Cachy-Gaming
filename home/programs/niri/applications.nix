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
  fileManager = "${pkgs.nautilus}/bin/nautilus";
  fileManagerTerminal = ["${pkgs.alacritty}/bin/alacritty" "-e" "yazi"];
  lockScreen = [noctalia "ipc" "call" "lockScreen" "lock"];
  nightShift = [noctalia "ipc" "call" "darkMode" "toggle"];
  noctaliaStart = [noctalia];
  # noctaliaStart = ["sh" "-c" "${noctalia} & sleep 3 && ${noctalia} ipc call lockScreen lock"];
  # noctaliaStart = ["sh" "-c" "${noctalia} & for i in {1..50}; do result=$(${noctalia} ipc call lockScreen lock 2>&1); if ! echo \"$result\" | grep -q 'No running instances\\|Target not found'; then exit 0; fi; sleep 0.2; done"];
  screenshot = [niri "msg" "action" "screenshot"];
  sessionScreen = [noctalia "ipc" "call" "sessionMenu" "toggle"];
  systemMonitor = ["${pkgs.alacritty}/bin/alacritty" "-e" "btop"];
  terminal = "${pkgs.alacritty}/bin/alacritty";
}
