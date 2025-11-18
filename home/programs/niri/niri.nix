# home/programs/niri/niri.nix
# Niri configuration for CachyOS
# For documentation and full reference,
# see: https://github.com/YaLTeR/niri/wiki
{inputs, ...}: {
  programs.niri.enable = true;

  imports = [
    inputs.niri.homeModules.niri # Import Niri's home-manager module
    ./settings.nix # Your custom configuration files for Niri
    ./keybinds.nix
    ./rules.nix
    ./autostart.nix
    ./scripts.nix
  ];
}
