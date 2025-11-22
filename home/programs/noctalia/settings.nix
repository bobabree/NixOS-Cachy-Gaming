# home/programs/noctalia/settings.nix
{...}: {
  # Configuration defaults: https://docs.noctalia.dev/getting-started/nixos/#config-ref
  programs.noctalia-shell = {
    # Configure noctalia here; defaults will
    # be deep merged with these attributes.
    # Additionally, if you use the systemd service,
    # editing the settings with the GUI will show the resulting configuration in
    # ~/.config/noctalia/gui-settings.json
    settings = {
    };
  };
  # TODO: Calendar events support
}
