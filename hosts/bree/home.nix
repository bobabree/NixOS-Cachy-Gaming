{
  config,
  pkgs,
  ...
}: {
  #===================================================================
  # IMPORTS
  #===================================================================

  imports = [
    ../../home/programs/helix.nix
    ../../home/programs/alacritty.nix
    ../../home/programs/fish.nix
    ../../home/programs/git.nix
  ];

  #===================================================================
  # HOME MANAGER SETTINGS
  #===================================================================

  # User information
  home.username = "bree";
  home.homeDirectory = "/home/bree";

  # Home Manager release version
  # DO NOT CHANGE - similar to system.stateVersion
  home.stateVersion = "25.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  #===================================================================
  # USER PACKAGES
  #===================================================================

  home.packages = with pkgs; [
    # CLI utilities
    tree # Directory tree viewer
    btop # Better top/htop
    wl-clipboard-rs

    # GitHub CLI
    gh # GitHub command-line tool
  ];

  #===================================================================
  # SESSION VARIABLES
  #===================================================================

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
