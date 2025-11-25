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
      # Basic silent boot
      "quiet" # Suppress most kernel messages
      "splash" # Enable Plymouth boot splash screen
      "plymouth.nolog" # Tell Plymouth not to show logs
      "plymouth.ignore-serial-consoles" # Hide serial console messages

      # Kernel logging levels (0=emergency, 3=error, 7=debug)
      "loglevel=0" # Show only errors and above (was 1 which shows almost nothing)

      # Systemd status messages
      "systemd.show_status=false" # Hide successful messages, show failures  (replaces rd.systemd.show_status=false)
      "rd.systemd.show_status=false" # Same as above but for initramfs (early boot stage)

      # Udev logging (device manager)
      "udev.log_level=0" # Reduce udev noise during regular boot
      "rd.udev.log_level=0" # Reduce udev noise in initramfs

      # Console cursor
      "vt.global_cursor_default=0" # Hide blinking cursor during boot/shutdown

      "console=tty2" # Redirect messages to tty2 (hidden)
      "pcie_aspm=force" # ASUS laptops need this
      "pcie_aspm.policy=powersupersave" # 40% less power (test stability)
      "i915.fastboot=1" # Fast boot for Intel GPU (if applicable)
      "i915.enable_guc=3" # Intel Graphics GuC firmware loading + submission
      "i915.enable_fbc=1" # Intel Framebuffer compression
      "intel_idle.max_cstate=1" # Intel Lunar Lake stuttering fix
      "acpi_osi=Linux"
    ];

    # Suppress kernel messages from being printed to console
    # Format: current default minimum boot-time-default
    kernel.sysctl = {
      "kernel.printk" = "0 0 0 0";
    };

    kernelModules = ["int340x_thermal_zone" "v4l2loopback" "i2c-dev"]; # Webcam + monitor control
    extraModprobeConfig = ''
      # Webcam
      options v4l2loopback video_nr=0 card_label="DroidCam" exclusive_caps=1

      # Audio power saving
      options snd_hda_intel power_save=1
      options snd_hda_intel power_save_controller=Y

      # WiFi power saving (Intel)
      options iwlwifi power_save=1
      options iwlmvm power_scheme=3
    '';

    # Module blacklist
    blacklistedKernelModules = [
      "intel_ish_ipc" # Disable auto-brightness to suppress ISH firmware errors
    ];

    # Plymouth boot splash screen (themed by Stylix)
    plymouth.enable = true;
    # initramfs runs before Plymouth fully takes over
    initrd.verbose = false; # Hide initramfs messages
  };

  # Disable slow services
  systemd.services."systemd-backlight@leds:asus::kbd_backlight".enable =
    false; # Disable keyboard backlight restoration. Takes too long to load.

  # SCX schedulers (CachyOS feature)
  services.scx.enable = true;
}
