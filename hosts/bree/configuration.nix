# hosts/bree/configuration.nix
{
  lib,
  pkgs,
  ...
}: {
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

  # Manually create portal configuration file
  environment.etc."xdg-desktop-portal/portals.conf".text = ''
    [preferred]
    default=gtk
    org.freedesktop.impl.portal.FileChooser=gtk
    org.freedesktop.impl.portal.AppChooser=gtk
    org.freedesktop.impl.portal.Print=gtk
    org.freedesktop.impl.portal.Screenshot=gnome
    org.freedesktop.impl.portal.ScreenCast=gnome
    org.freedesktop.impl.portal.RemoteDesktop=gnome
    org.freedesktop.impl.portal.Settings=gnome
    org.freedesktop.impl.portal.Inhibit=gnome
  '';

  # XDG Desktop Portal for screensharing on Wayland
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # Suppress the warning (doesn't actually do anything since we use environment.etc)
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
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
    printing.enable = true; # CUPS printing
    gvfs.enable = true; # Virtual filesystems (USB automount)
    tumbler.enable = true; # Thumbnail generation

    # Power/Battery Feature Management
    # power-profiles-daemon.enable = true;
    tuned.enable = true;
    upower.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  systemd = {
    # To prevent getting stuck at shutdown
    settings.Manager.DefaultTimeoutStopSec = "10s";

    services = {
      greetd.serviceConfig = {
        Type = "idle";
        StandardInput = "tty";
        StandardOutput = "tty";
        StandardError = "journal";
        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
      };
    };

    # Create user-writable wallpaper directory for Wallhaven downloads
    tmpfiles.rules = [
      "d /home/bree/Pictures 0755 bree users -"
      "d /home/bree/Pictures/Wallpapers 0755 bree users -"
    ];
  };

  # Enable dconf (required for GTK settings)
  programs.dconf.enable = true;

  # Calendar events via evolution-data-server
  services.gnome.evolution-data-server.enable = true;
  environment.systemPackages = with pkgs; [
    (python3.withPackages (pyPkgs: with pyPkgs; [pygobject3]))
    polkit_gnome
  ];
  environment.sessionVariables = {
    GI_TYPELIB_PATH = lib.makeSearchPath "lib/girepository-1.0" (
      with pkgs; [
        evolution-data-server
        libical
        glib.out
        libsoup_3
        json-glib
        gobject-introspection
      ]
    );
  };

  # Polkit authentication agent (lightweight, no DE needed)
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
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
