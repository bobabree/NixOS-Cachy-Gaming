# hosts/bree/system/default.nix
{...}: {
  # Import all system modules for this host
  imports = [
    ./audio.nix
    ./boot.nix
    ./graphics.nix
    ./localization.nix
    ./networking.nix

    ./programs # Automatically finds programs/default.nix
  ];

  # Apply overlays for this host
  nixpkgs.overlays = [(import ./overlays.nix)];
}
