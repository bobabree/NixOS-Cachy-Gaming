# home/programs/vesktop.nix
{config, ...}: {
  programs.vesktop = {
    enable = true;

    vencord = {
      settings = {
        useQuickCss = true;
        # Enable the Noctalia theme
        enabledThemes = ["noctalia.theme.css"];
      };

      # Point to Noctalia's generated theme
      themes = {
        "noctalia.theme.css" = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/vesktop/themes/noctalia.theme.css";
      };
    };
  };
}
