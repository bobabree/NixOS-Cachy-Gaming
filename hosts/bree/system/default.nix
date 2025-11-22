# hosts/bree/system/default.nix
{...}: {
  # Import all system modules for this host
  imports = [
    ./boot.nix
    ./networking.nix
    ./audio.nix
    ./graphics.nix

    ./programs # Automatically finds programs/default.nix
  ];

  # Apply overlays for this host
  nixpkgs.overlays = [(import ./overlays.nix)];
}
