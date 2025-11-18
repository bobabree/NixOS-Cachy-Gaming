# home/programs/niri/application.nix
{pkgs}: {
  browser = "${pkgs.firefox}/bin/firefox";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  # fileManager = "${pkgs.xfce.thunar}/bin/thunar";
  # appLauncher = "${pkgs.walker}/bin/walker";

  # Screenshot tools using fish (requires grim, slurp, wl-clipboard-rs)
  # screenshotArea = "${pkgs.fish}/bin/fish -c '${pkgs.grim}/bin/grim -g (${pkgs.slurp}/bin/slurp) - | ${pkgs.wl-clipboard-rs}/bin/wl-copy'";
  # screenshotWindow = "${pkgs.fish}/bin/fish -c '${pkgs.grim}/bin/grim -g (${pkgs.slurp}/bin/slurp -w) - | ${pkgs.wl-clipboard-rs}/bin/wl-copy'";
  #screenshotOutput = "${pkgs.fish}/bin/fish -c '${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard-rs}/bin/wl-copy'";
}
