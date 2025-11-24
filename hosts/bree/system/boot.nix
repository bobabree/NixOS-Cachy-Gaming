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
      timeout = 0; # Instant boot

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        device = "nodev"; # EFI mode (no legacy BIOS)
        efiSupport = true;
        useOSProber = true; # Detect other operating systems
        gfxmodeEfi = "1440x900";
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
      "loglevel=3" # Hide most messages
      "rd.systemd.show_status=false" # Hide systemd status
      "rd.udev.log_level=3" # Quiet udev

      # ACPI workarounds (test one at a time)
      "pnpacpi=off" # Workaround for ACPI USB errors. May break auto-detection of legacy devices.
      # "acpi_osi=Linux" # Make BIOS think we're Linux. May change power/thermal behavior.
      # "acpi_osi=!" # Disable all ACPI OS interfaces. May break vendor-specific features.
    ];

    kernelModules = ["v4l2loopback" "i2c-dev"]; # Webcam + monitor control
    extraModprobeConfig = ''
      options v4l2loopback video_nr=0 card_label="DroidCam" exclusive_caps=1
    '';

    # Module blacklist
    blacklistedKernelModules = [
      "intel_ish_ipc" # Disable auto-brightness to suppress ISH firmware errors
    ];

    # Plymouth boot splash screen (themed by Stylix)
    plymouth.enable = true;
  };

  # Disable slow services
  systemd.services."systemd-backlight@leds:asus::kbd_backlight".enable =
    false; # Disable keyboard backlight restoration. Takes too long to load.

  # SCX schedulers (CachyOS feature)
  services.scx.enable = true;
}
