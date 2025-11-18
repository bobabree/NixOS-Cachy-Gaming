# hosts/bree/home.nix
{...}: {
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
}
