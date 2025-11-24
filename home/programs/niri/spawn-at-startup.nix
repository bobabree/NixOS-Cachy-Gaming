# home/programs/niri/spawn-at-startup.nix
# ────────────── Startup Applications ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#spawn-sh-at-startup
{
  config,
  pkgs,
  ...
}: let
  apps = import ./applications.nix {inherit pkgs config;};
in {
  programs.niri.settings = {
    # Spawn processes/shell commands at niri startup
    spawn-at-startup = [
      {command = apps.noctaliaStart;}

      # {command = apps.lockScreenDelayed;}
      # Apps
      {command = [apps.terminal];}
      {command = apps.aiTerminal;}
      {command = [apps.browser];}
      {command = [apps.chat];}
      {command = ["xwayland-satellite"];}

      # Pywalfox (using sh for &&)
      {command = ["sh" "-c" "pywalfox install && pywalfox update"];}
    ];
  };
}
