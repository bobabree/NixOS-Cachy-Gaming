# home/programs/niri/spawn-at-startup.nix
# ────────────── Startup Applications ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#spawn-sh-at-startup
{...}: {
  programs.niri.settings = {
    # Spawn processes/shell commands at niri startup
    spawn-at-startup = [
      {command = ["alacritty"];}
      {command = ["firefox"];}
      {command = ["vesktop"];}

      # {command = ["systemctl" "--user" "start" "hyprpolkitagent"];}
      # {command = ["arrpc"];}
      {command = ["xwayland-satellite"];}
      {command = ["noctalia-shell"];}
    ];
  };
}
