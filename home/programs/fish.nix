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
      rebuild = "sh -c 'cd /etc/nixos && sudo git add *' && sudo nixos-rebuild switch --flake /etc/nixos#bree && exec fish";
      update = "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#bree && exec fish";

      # Git shortcuts
      gs = "git status";
      ga = "sh -c 'cd /etc/nixos && sudo git add *'";
      gc = "sudo git commit -m";
      gd = "sudo git rm -rf";
      gp = "git push origin master";

      # Editor
      shx = "sudoedit";
      shxc = "sudoedit /etc/nixos/hosts/bree/configuration.nix";
      shxf = "sudoedit /etc/nixos/flake.nix";
      shxh = "sudoedit /etc/nixos/hosts/bree/home.nix";

      cdb = "cd /etc/nixos/hosts/bree";
      cde = "cd /etc/nixos";
      cdh = "cd /etc/nixos/home";
      cdn = "cd /etc/nixos/home/programs/niri";
      cdp = "cd /etc/nixos/home/programs";
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
