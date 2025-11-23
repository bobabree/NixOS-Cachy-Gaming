# home/programs/tmux.nix
{...}: {
  programs.tmux = {
    enable = true;
    mouse = true; # Enable mouse support (click to switch panes, scroll, etc.)
    terminal = "tmux-256color"; # Better color support
    keyMode = "vi"; # Use vim-style keybindings in copy mode
    clock24 = true; # 24-hour clock format
  };
}
