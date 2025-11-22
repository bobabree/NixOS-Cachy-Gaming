# hosts/bree/configuration.nix
{pkgs, ...}: {
  #===================================================================
  # USERS
  #===================================================================

  programs.fish.enable = true;
  users.users.bree = {
    isNormalUser = true;
    shell = pkgs.fish;

    extraGroups = [
      "networkmanager" # Change network settings
      "wheel" # Sudo access
      "video" # Access video devices
      "input" # Access input devices
      "plugdev" # USB devices
      "i2c" # Monitor control via DDC
      "bluetooth" # Bluetooth management
    ];

    # User packages are managed in home.nix
  };

  users.groups.i2c = {}; # Group for monitor control (ddcutil)

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # XDG Desktop Portal for screensharing on Wayland
  xdg.portal = {
    enable = true;
    config = {
      #common.default = "*";
      common = {
        default = ["gnome" "gtk"];
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
      };
    };
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      # xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk

      # Niri
      xdg-desktop-portal-gnome
    ];
  };

  # Greetd
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --remember  --asterisks  --container-padding 2 --no-xsession-wrapper --cmd niri-session";
          user = "greeter";
        };
      };
    };

    dbus.enable = true; # Inter-process communication
    power-profiles-daemon.enable = true; # Power management
    printing.enable = true; # CUPS printing
    gvfs.enable = true; # Virtual filesystems (USB automount)
    tumbler.enable = true; # Thumbnail generation
  };

  systemd = {
    # To prevent getting stuck at shutdown
    settings.Manager.DefaultTimeoutStopSec = "10s";

    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
  #===================================================================
  # NIX SETTINGS
  #===================================================================

  nix.settings = {
    # Enable Flakes and new Nix commands
    experimental-features = ["nix-command" "flakes"];

    # Optimize store automatically
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d"; # Clean old generations
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

  #===================================================================
  # CPU OPTIMIZATION (EXPERIMENTAL)
  #===================================================================
  #
  # Uncomment to enable system-wide CPU optimization for x86-64-v3
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
}
