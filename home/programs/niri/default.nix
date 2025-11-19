# home/programs/niri/default.nix
# Niri configuration for CachyOS
# For documentation and full reference,
# see: https://github.com/YaLTeR/niri/wiki
{inputs, ...}: {
  programs.niri.enable = true;

  imports = [
    inputs.niri.homeModules.niri # Import Niri's home-manager module
    ./input.nix
    ./keybinds.nix
    ./layout.nix
    ./outputs.nix
    ./rules.nix
    ./settings.nix
    ./spawn-at-startup.nix
  ];
}
