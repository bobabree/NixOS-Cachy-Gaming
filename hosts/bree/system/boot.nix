# hosts/bree/system/boot.nix
{pkgs, ...}: {
  #===================================================================
  # BOOT & KERNEL
  #===================================================================

  # Bootloader configuration
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # CachyOS kernel optimized for x86-64-v3
    kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {
      mArch = "GENERIC_V3";
    };

    kernelParams = [
      "video=eDP-1:2880x1800@120" # Force monitor resolution/refresh
    ];

    kernelModules = ["v4l2loopback" "i2c-dev"]; # Webcam + monitor control
    extraModprobeConfig = ''
      options v4l2loopback video_nr=0 card_label="DroidCam" exclusive_caps=1
    '';
  };

  # SCX schedulers (CachyOS feature)
  services.scx.enable = true;
}
