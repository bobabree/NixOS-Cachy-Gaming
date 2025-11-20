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
      "wheel" # sudo access
      "networkmanager" # network configuration
    ];
    # User packages are managed in home.nix
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  # XDG Desktop Portal for screensharing on Wayland
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome # Required for niri screencasting!
    ];
    config.common.default = "gnome";
  };

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  # Allow unfree packages (required for Steam)
  nixpkgs.config.allowUnfree = true;

  # Greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --remember  --asterisks  --container-padding 2 --no-xsession-wrapper --cmd niri-session";
        user = "greeter";
      };
    };
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
