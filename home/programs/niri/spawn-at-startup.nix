# home/programs/niri/spawn-at-startup.nix
# ────────────── Startup Applications ──────────────
# https://github.com/YaLTeR/niri/wiki/Configuration:-Miscellaneous#spawn-sh-at-startup
{...}: {
  programs.niri.settings.spawn-at-startup = [
    # {command = ["systemctl" "--user" "start" "hyprpolkitagent"];}
    # {command = ["arrpc"];}
    # {command = ["xwayland-satellite"];}
    # {command = ["qs"];}
    # {command = ["vesktop"];}
    # {command = ["waybar"];}
    # {command = ["swww-daemon"];}
    #{ command = ["${pkgs.swaybg}/bin/swaybg" "-o" "DP-1" "-i" "/home/lysec/nixos/assets/wallpapers/clouds.png" "-m" "fill"]; }
    #{ command = ["sh" "-c" "swww-daemon & swww img /home/lysec/nixos/wallpapers/cloud.png"]; }
  ];
}
