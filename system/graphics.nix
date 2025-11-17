# system/graphics.nix
{pkgs, ...}: {
  #===================================================================
  # GRAPHICS
  #===================================================================

  # Graphics drivers (Intel Arc)
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # VAAPI for Intel Arc
      libva # Video Acceleration API
    ];
  };

  # Input devices
  services.libinput.enable = true;
}
