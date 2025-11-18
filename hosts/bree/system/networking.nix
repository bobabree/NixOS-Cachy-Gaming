# hosts/bree/system/networking.nix
{...}: {
  #===================================================================
  # NETWORKING
  #===================================================================

  networking = {
    hostName = "bree";
    networkmanager.enable = true;
  };
}
