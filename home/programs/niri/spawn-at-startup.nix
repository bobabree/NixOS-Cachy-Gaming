# home/programs/niri/spawn-at-startup.nix
# ────────────── Startup Applications ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#spawn-sh-at-startup
{pkgs, ...}: {
  programs.niri.settings = {
    # Spawn processes/shell commands at niri startup
    spawn-at-startup = [
      {command = ["alacritty" "--working-directory" "/etc/nixos"];}

      {command = ["firefox"];}
      {command = ["sh" "-c" "cd /etc/nixos"];}

      # Permanent warm tone
      {command = ["gammastep" "-O" "4200"];}

      # {command = ["systemctl" "--user" "start" "hyprpolkitagent"];}
      # {command = ["arrpc"];}
      {command = ["xwayland-satellite"];}
      # {command = ["qs"];}
      # {command = ["vesktop"];}
      # {command = ["waybar"];}
      # {command = ["swww-daemon"];}
      # Static background
      {command = ["swaybg" "-i" "/etc/nixos/hosts/bree/assets/rose-1.png" "-m" "fill"];}
      #{ command = ["${pkgs.swaybg}/bin/swaybg" "-o" "DP-1" "-i" "/home/lysec/nixos/assets/wallpapers/clouds.png" "-m" "fill"]; }
      #{ command = ["sh" "-c" "swww-daemon & swww img /home/lysec/nixos/wallpapers/cloud.png"]; }
    ];
  };
}
