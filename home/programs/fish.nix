#  home/programs/fish.nix
{...}: {
  #===================================================================
  # SHELL CONFIGURATION
  #===================================================================

  programs.fish = {
    enable = true;

    # Shell aliases
    shellAliases = {
      # Navigation
      ll = "ls -la";
      la = "ls -a";

      # NixOS shortcuts
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#bree && exec fish";
      update = "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#bree && exec fish";

      # Git shortcuts
      gs = "git status";
      ga = "git add *";
      gc = "git commit -m";
      gp = "git push origin master";

      # Editor
      shx = "sudoedit";

      shxc = "sudoedit /etc/nixos/hosts/bree/configuration.nix";
      shxf = "sudoedit /etc/nixos/flake.nix";
      shxh = "sudoedit /etc/nixos/hosts/bree/home.nix";
      shxn = "sudoedit /etc/nixos/assets/niri/config.kdl";
    };

    # Shell initialization
    shellInit = ''
      # Disable greeting
      set fish_greeting

      # Set color scheme
      set -g fish_color_command green
      set -g fish_color_error red
    '';
  };
}
