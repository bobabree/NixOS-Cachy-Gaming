{ config, lib, pkgs, ... }:

{
  #===================================================================
  # IMPORTS
  #===================================================================

  imports = [
    ./hardware-configuration.nix
  ];

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

  #===================================================================
  # CPU OPTIMIZATION (EXPERIMENTAL)
  #===================================================================
  # 
  # Uncomment to enable system-wide CPU optimization for x86-64-v3
  # WARNING: This will rebuild ALL packages from source (no binary cache)
  # Build time: Several hours on first rebuild
  #
  # nixpkgs.hostPlatform = {
  #   gcc.arch = "x86-64-v3";
  #   gcc.tune = "x86-64-v3";
  #   system = "x86_64-linux";
  # };
  #
  # nix.settings.system-features = [
  #   "nixos-test"
  #   "benchmark"
  #   "big-parallel"
  #   "kvm"
  #   "gccarch-x86-64-v3"
  # ];

  #===================================================================
  # NETWORKING
  #===================================================================

  networking = {
    hostName = "bree";
    networkmanager.enable = true;
  };

  #===================================================================
  # LOCALIZATION
  #===================================================================

  time.timeZone = "America/Los_Angeles";

  # Uncomment for internationalization support
  # i18n.defaultLocale = "en_US.UTF-8";

  #===================================================================
  # HARDWARE
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

  #===================================================================
  # AUDIO
  #===================================================================

  # Use PipeWire (modern audio system)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Disable PulseAudio (replaced by PipeWire)
  services.pulseaudio.enable = false;

  # Real-time audio priority
  security.rtkit.enable = true;

  #===================================================================
  # PRINTING (DISABLED)
  #===================================================================

  services.printing.enable = false;

  #===================================================================
  # DISPLAY & WINDOW MANAGERS
  #===================================================================

  # Niri - Scrollable-tiling Wayland compositor
  programs.niri.enable = true;
  environment.etc."niri/config.kdl".source = ./config.kdl;

  #===================================================================
  # BROWSERS
  #===================================================================

  programs.firefox = {
    enable = true;

    # Wayland + PipeWire for screensharing
    wrapperConfig = {
      pipewireSupport = true;
    };

    # Power-efficient settings optimized for Intel Arc
    preferences = {
      # Hardware video decoding (VA-API)
      "media.ffmpeg.vaapi.enabled" = true;
      "media.hardware-video-decoding.enabled" = true;
      "media.hardware-video-decoding.force-enabled" = true;

      # GPU-accelerated rendering (WebRender)
      "gfx.webrender.all" = true;
      "gfx.webrender.enabled" = true;

      # Use system FFmpeg for better codec support
      "media.ffvpx.enabled" = false;
      "media.rdd-vpx.enabled" = false;

      # Force hardware compositing
      "layers.acceleration.force-enabled" = true;

      # Wayland integration
      "widget.use-xdg-desktop-portal.file-picker" = 1;

      # Battery optimization - reduce process count
      "dom.ipc.processCount" = 4;
    };
  };

  #===================================================================
  # SHELLS
  #===================================================================

  # Enable fish system-wide (required for user shell)
  programs.fish.enable = true;

  #===================================================================
  # USERS
  #===================================================================

  users.users.bree = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel" # sudo access
      "networkmanager" # network configuration
    ];
    # User packages are managed in home.nix
  };

  #===================================================================
  # SYSTEM PACKAGES
  #===================================================================
  # 
  # Note: User-specific packages are managed in home.nix
  # Only system-wide utilities should be listed here
  #
  environment.systemPackages = with pkgs; [
    # System utilities
    brightnessctl # Backlight control for laptops

    # Development essentials
    gcc # C/C++ compiler (needed for some builds)

    # Emergency editor (always available if home-manager breaks)
    vim
  ];

  #===================================================================
  # FONTS
  #===================================================================

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  #===================================================================
  # ENVIRONMENT VARIABLES
  #===================================================================

  environment.sessionVariables = {
    # Firefox optimizations
    MOZ_ENABLE_WAYLAND = "1"; # Native Wayland support
    MOZ_USE_XINPUT2 = "1"; # Better touchpad gestures
  };

  #===================================================================
  # NIX SETTINGS
  #===================================================================

  nix.settings = {
    # Enable Flakes and new Nix commands
    experimental-features = [ "nix-command" "flakes" ];

    # Optimize store automatically
    auto-optimise-store = true;
  };

  #===================================================================
  # SYSTEM STATE VERSION
  #===================================================================
  # 
  # DO NOT CHANGE THIS VALUE
  # This defines the first version of NixOS installed on this machine.
  # See: https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  #
  system.stateVersion = "25.05";
}
