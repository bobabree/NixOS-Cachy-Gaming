{ config, pkgs, ... }:

{
  #===================================================================
  # HOME MANAGER SETTINGS
  #===================================================================

  # User information
  home.username = "bree";
  home.homeDirectory = "/home/bree";

  # Home Manager release version
  # DO NOT CHANGE - similar to system.stateVersion
  home.stateVersion = "25.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  #===================================================================
  # TEXT EDITORS
  #===================================================================

  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        line-number = "relative";
        mouse = false;
        cursorline = true;
        auto-save = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
        };

        lsp = {
          display-messages = true;
        };
      };

      # Keybindings
      keys.normal = {
        # space.space = "file_picker";
        # space.w = ":w";
        # space.q = ":q";
        # esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };

    # Language-specific settings
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "nixpkgs-fmt";
          language-servers = [ "nil" ];
        }
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "python";
          auto-format = true;
        }
      ];
    };
  };

  #===================================================================
  # TERMINAL EMULATORS
  #===================================================================

  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.95;
        padding = {
          x = 10;
          y = 10;
        };
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        size = 12.0;
      };

      colors = {
        primary = {
          background = "0x1e1e1e";
          foreground = "0xd4d4d4";
        };
      };
    };
  };

  #===================================================================
  # VERSION CONTROL
  #===================================================================
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "bobabree";
        email = "bree.huynh@berkeley.edu";
      };
      init = {
        defaultBranch = "master";
      };
      url."git@github.com:".insteadOf = "https://github.com/";
    };
  };
  #===================================================================
  # SHELL CONFIGURATION
  #===================================================================

  programs.fish = {
    enable = true;

    # Shell aliases
    shellAliases = {
      # Navigation
      ll = "ls -la";
      la = "ls -a";

      # NixOS shortcuts
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#bree";
      update = "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#bree";

      # Git shortcuts
      gs = "git status";
      ga = "git add *";
      gp = "git push origin master";

      # Editor
      shx = "sudoedit";
    };

    # Shell initialization
    shellInit = ''
      # Disable greeting
      set fish_greeting
      
      # Set color scheme
      set -g fish_color_command green
      set -g fish_color_error red
    '';
  };

  #===================================================================
  # USER PACKAGES
  #===================================================================

  home.packages = with pkgs; [
    # CLI utilities
    tree # Directory tree viewer
    btop # Better top/htop
    ripgrep # Fast grep alternative
    fd # Fast find alternative
    fzf # Fuzzy finder

    # GitHub CLI
    gh # GitHub command-line tool

    # Nix language tools
    nil # Nix LSP server
    nixpkgs-fmt # Nix formatter

    # Development tools
    # Add more as needed
  ];

  #===================================================================
  # DOTFILES & CONFIG FILES
  #===================================================================

  # You can manage dotfiles here
  # home.file.".config/some-app/config.conf".text = ''
  #   # configuration content
  # '';

  #===================================================================
  # SESSION VARIABLES
  #===================================================================

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
