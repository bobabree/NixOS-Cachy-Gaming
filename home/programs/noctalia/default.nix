# home/programs/noctalia/default.nix
# Noctalia configuration for NixOS-Cachy-Gaming
# For documentation and full reference,
# see: https://docs.noctalia.dev/
{
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.noctalia-shell.enable = true;

  imports = [
    inputs.noctalia.homeModules.default # Import Noctalia's home-manager module
    ./settings.nix
  ];
}
