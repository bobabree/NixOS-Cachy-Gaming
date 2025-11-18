# hosts/bree/configuration.nix
{...}: {
  #===================================================================
  # USERS
  #===================================================================

  users.users.bree = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # sudo access
      "networkmanager" # network configuration
    ];
    # User packages are managed in home.nix
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
