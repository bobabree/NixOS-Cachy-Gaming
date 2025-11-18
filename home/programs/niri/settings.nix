# home/programs/niri/settings.nix
{...}: {
  programs.niri.settings = {
    input = {
      keyboard.xkb.layout = "us";
    };
    layout = {
      gap = 0;
    };
  };
}
