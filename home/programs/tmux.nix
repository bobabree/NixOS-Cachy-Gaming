# home/programs/tmux.nix
{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    # Terminal settings
    terminal = "tmux-256color";

    # Improve responsiveness
    escapeTime = 0; # Fix Helix mode switching delay

    # Enable features
    mouse = true;
    keyMode = "vi";
    clock24 = true;

    # Session persistence
    plugins = with pkgs.tmuxPlugins; [
      resurrect # Save/restore sessions
      continuum # Auto-save
    ];

    # Fix focus events for Helix auto-reload
    extraConfig = ''
            # True color support for Helix
            set-option -sa terminal-overrides ",alacritty*:Tc"
            set-option -sa terminal-overrides ",xterm*:Tc"

            # Enable focus events (Helix needs this for auto-reload)
            set-option -g focus-events on

            # Fix colors
            set-option -g default-terminal "tmux-256color"

            # Clipboard integration (copy to system clipboard)
            set-option -g set-clipboard on

            # Undercurl support (for Helix diagnostics)
            set-option -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
            set-option -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/
      %d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

            # Start windows and panes at 1, not 0
            set -g base-index 1
            setw -g pane-base-index 1

            # Renumber windows when one is closed
            set-option -g renumber-windows on

            # Better split commands (| and -)
            bind | split-window -h -c "#{pane_current_path}"
            bind - split-window -v -c "#{pane_current_path}"
            unbind '"'
            unbind %

            # Reload config with r
            bind r source-file ~/.config/tmux/tmux.conf \; display "Config
      reloaded!"

            # tmux-continuum: auto-restore on tmux start
            set -g @continuum-restore 'on'

            # tmux-continuum: auto-save interval (minutes)
            set -g @continuum-save-interval '1'
    '';
  };
}
