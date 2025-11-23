# home/programs/niri/spawn-at-startup.nix
# ────────────── Startup Applications ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#spawn-sh-at-startup
{...}: {
  programs.niri.settings = {
    # Spawn processes/shell commands at niri startup
    spawn-at-startup = [
      {
        command = [
          "alacritty"
          "-e"
          "tmux"
          "new-session"
          "-A"
          "-s"
          "boba"
          "\\;"
          "split-window"
          "-v"
        ];
      }
      {command = ["firefox"];}
      {command = ["vesktop"];}

      # {command = ["systemctl" "--user" "start" "hyprpolkitagent"];}
      # {command = ["arrpc"];}
      {command = ["xwayland-satellite"];}
      {command = ["noctalia-shell"];}
    ];
  };
}
