# home/programs/niri/niri.nix
{inputs, ...}: {
  # programs.niri.enable = true;

  imports = [
    inputs.niri.homeModules.niri
    ./keybinds.nix
    ./settings.nix
  ];
}
