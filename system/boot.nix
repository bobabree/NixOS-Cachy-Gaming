# system/boot.nix
{pkgs, ...}: {
  #===================================================================
  # BOOT & KERNEL
  #===================================================================

  # Bootloader configuration
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # CachyOS kernel optimized for x86-64-v3
  boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride {
    mArch = "GENERIC_V3";
  };

  # SCX schedulers (CachyOS feature)
  services.scx.enable = true;
}
