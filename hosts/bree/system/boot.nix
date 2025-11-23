# hosts/bree/system/boot.nix
{pkgs, ...}: {
  #===================================================================
  # BOOT & KERNEL
  #===================================================================

  # Bootloader configuration
  boot = {
    loader = {
      # GRUB bootloader with theming support
      systemd-boot.enable = false; # Disabled in favor of GRUB
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        device = "nodev"; # EFI mode (no legacy BIOS)
        efiSupport = true;
        useOSProber = true; # Detect other operating systems
      };
    };

    # CachyOS kernel optimized for x86-64-v3
    kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {
      mArch = "GENERIC_V3";
    };

    kernelParams = [
      # "video=eDP-1:2880x1800@120" # Force monitor resolution/refresh
      "quiet" # Reduce boot messages for cleaner Plymouth display
      "splash" # Enable Plymouth boot splash
    ];

    kernelModules = ["v4l2loopback" "i2c-dev"]; # Webcam + monitor control
    extraModprobeConfig = ''
      options v4l2loopback video_nr=0 card_label="DroidCam" exclusive_caps=1
    '';

    # Plymouth boot splash screen (themed by Stylix)
    plymouth.enable = true;
  };

  # SCX schedulers (CachyOS feature)
  services.scx.enable = true;
}
