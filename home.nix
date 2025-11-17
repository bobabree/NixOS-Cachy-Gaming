{
  config,
  pkgs,
  ...
}: {
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

  # #===================================================================
  # # DISPLAY & WINDOW MANAGERS
  # #===================================================================

  # # Niri - Scrollable-tiling Wayland compositor
  # home.file.".config/niri/config.kdl".source = ./config.kdl;

  #===================================================================
  # TEXT EDITORS
  #===================================================================

  programs.helix = {
    enable = true;

    # Main configuration (config.toml)
    settings = {
      # Theme name from available themes
      theme = "catppuccin_mocha";

      editor = {
        # Number of lines of padding around edge when scrolling
        # scrolloff = 5;

        # Enable mouse support
        mouse = true;

        # Enable middle-click paste
        middle-click-paste = true;

        # Lines to scroll per scroll wheel step
        scroll-lines = 3;

        # Shell to use for external commands [command, args...]
        shell = ["fish" "-i" "-c"];

        # Line number display: "absolute" or "relative"
        # line-number = "relative";

        # Highlight all lines with cursor
        # cursorline = false;

        # Highlight all columns with cursor
        # cursorcolumn = false;

        # Gutters to display: "diagnostics", "diff", "line-numbers", "spacer"
        # gutters = [ "diagnostics" "spacer" "line-numbers" "spacer" "diff" ];

        # Auto-popup completion menu
        auto-completion = true;

        # Auto-format on save
        auto-format = true;

        # Milliseconds before idle timers trigger
        # idle-timeout = 250;

        # Milliseconds after typing before showing completions
        # completion-timeout = 250;

        # Apply completion instantly when selected
        preview-completion-insert = true;

        # Min word length to trigger autocompletion
        # completion-trigger-len = 2;

        # Always replace entire word, not just part before cursor
        # completion-replace = false;

        # Display info boxes
        auto-info = true;

        # Override terminal truecolor detection
        # true-color = false;

        # Override terminal undercurl detection
        # undercurl = false;

        # Column positions for rulers [80, 120]
        # rulers = [ ];

        # Show bufferline: "always", "never", or "multiple"
        # bufferline = "never";

        # Color mode indicator differently per mode
        # color-modes = false;

        # Max line length for :reflow and soft-wrapping
        # text-width = 80;

        # Directories treated as LSP roots (project-local only)
        # workspace-lsp-roots = [ ];

        # Line ending for new docs: "native", "lf", "crlf", "ff", "cr", "nel"
        # default-line-ending = "native";

        # Auto-insert trailing newline on save
        # insert-final-newline = true;

        # Border style: "popup", "menu", "all", or "none"
        # popup-border = "none";

        # Indentation computation: "simple", "tree-sitter", or "hybrid"
        # indent-heuristic = "hybrid";

        # Characters for jump labels
        # jump-label-alphabet = "abcdefghijklmnopqrstuvwxyz";

        # Min diagnostic severity at line end: "disable", "hint", "info", "warning", "error"
        # end-of-line-diagnostics = "disable";

        # Statusline configuration
        # statusline = {
        # Elements aligned left
        # left = [ "mode" "spinner" "file-name" ];
        # Elements in center
        # center = [ ];
        # Elements aligned right
        # right = [ "diagnostics" "selections" "position" "file-encoding" ];
        # Separator character between elements
        # separator = "│";

        # Custom mode text
        # mode = {
        # normal = "NORMAL";
        # insert = "INSERT";
        # select = "SELECT";
        # };
        # };

        # LSP configuration
        lsp = {
          # Enable LSP integration globally
          enable = true;
          # Show LSP messages below statusline
          display-messages = true;
          # Auto-popup signature help (parameter hints)
          auto-signature-help = true;
          # Display inlay hints
          display-inlay-hints = true;
          # Show docs under signature help popup
          display-signature-help-docs = true;
          # Enable snippet completions
          snippets = true;
          # Include declaration in goto references
          goto-reference-include-declaration = true;
        };

        # Cursor shape per mode: "block", "bar", "underline", "hidden"
        # cursor-shape = {
        # normal = "block";
        # insert = "bar";
        # select = "underline";
        # };

        # File picker settings
        file-picker = {
          # Show hidden files
          hidden = true;
          # Follow symlinks
          follow-symlinks = true;
          # Ignore duplicate symlinks
          deduplicate-links = true;
          # Read parent directory ignore files
          parents = true;
          # Read .ignore files
          ignore = true;
          # Read .gitignore files
          git-ignore = true;
          # Read global gitignore (core.excludesfile)
          git-global = true;
          # Read .git/info/exclude
          git-exclude = true;
          # Max recursion depth (null = unlimited)
          # max-depth = null;
        };

        # Auto-pairs: true or table of character pairs
        auto-pairs = true;
        # Example custom pairs:
        # auto-pairs = {
        #   "(" = ")";
        #   "{" = "}";
        #   "[" = "]";
        #   "\"" = "\"";
        #   "`" = "`";
        #   "<" = ">";
        # };

        # Auto-save settings
        # auto-save = {
        #   # Save when focus leaves Helix
        #   focus-lost = false;
        #   # Save after delay
        #   after-delay = {
        #     enable = false;
        #     # Milliseconds after last edit before saving
        #     timeout = 3000;
        #   };
        # };

        # Search settings
        search = {
          # Case-insensitive unless pattern has uppercase
          smart-case = true;
          # Wrap search after depleting matches
          wrap-around = true;
        };

        # Whitespace rendering
        whitespace = {
          # Render mode: "all", "none", or table
          render = "none";
          # Characters to use for each whitespace type
          characters = {
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };

        # Indent guides
        indent-guides = {
          # Render vertical indent guides
          render = false;
          # Character for guides: "│", "╎", "┆", "┊", "⸽"
          character = "│";
          # Number of indent levels to skip
          skip-levels = 0;
        };

        # Soft wrap settings
        soft-wrap = {
          # Enable soft wrapping
          enable = false;
          # Max free space at line end
          max-wrap = 20;
          # Max indentation to carry over
          max-indent-retain = 40;
          # Text before wrapped lines
          wrap-indicator = "↪";
          # Wrap at text-width instead of viewport
          wrap-at-text-width = false;
        };

        # Smart tab settings
        smart-tab = {
          # Use tab for tree-sitter navigation
          enable = true;
          # Tab overrides menu cycling
          supersede-menu = false;
        };

        # Inline diagnostics (Helix 25.01+)
        inline-diagnostics = {
          # Show on cursor line: "disable", "hint", "info", "warning", "error"
          cursor-line = "hint";
          # Show on other lines: "disable", "hint", "info", "warning", "error"
          other-lines = "hint";
        };
      };

      # Keybindings (optional)
      keys.normal = {
        # Example custom keybinds
        # space.space = "file_picker";
        # space.w = ":w";
        # space.q = ":q";
      };
    };

    # Language configuration (languages.toml)
    languages = {
      language-server = {
        rust-analyzer = {
          command = "rust-analyzer";
          config = {
            checkOnSave.command = "clippy";
          };
        };

        clangd = {
          command = "clangd";
        };

        # Ruff built-in server for linting/formatting
        ruff = {
          command = "ruff";
          args = ["server"];
        };

        # Basedpyright for type checking
        basedpyright = {
          command = "basedpyright-langserver";
          args = ["--stdio"];
        };

        nixd = {
          command = "nixd";
          config = {
            nixpkgs.expr = "import <nixpkgs> { }";
            formatting.command = ["alejandra"];
          };
        };
      };

      language = [
        {
          name = "rust";
          auto-format = true;
          language-servers = ["rust-analyzer"];
          formatter = {
            command = "rustfmt";
            args = ["--edition" "2021"];
          };
        }
        {
          name = "cpp";
          auto-format = true;
          language-servers = ["clangd"];
          formatter = {
            command = "clang-format";
          };
        }
        {
          name = "c";
          auto-format = true;
          language-servers = ["clangd"];
          formatter = {
            command = "clang-format";
          };
        }
        {
          name = "python";
          auto-format = true;
          language-servers = ["ruff" "basedpyright"];
          formatter = {
            command = "ruff";
            args = ["format" "-"];
          };
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = ["nixd"];
          formatter = {
            command = "alejandra";
          };
        }
      ];
    };
    extraPackages = with pkgs; [
      # Rust
      rust-analyzer
      rustfmt

      # C/C++
      clang-tools

      # Python - ruff has built-in LSP now, basedpyright for type checking
      ruff
      basedpyright # or pyright

      # Nix - nixd is newer with better features than nil
      nixd
      alejandra # or nixfmt-rfc-style
    ];
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
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#bree && exec fish";
      update = "nix flake update /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#bree && exec fish";

      # Git shortcuts
      gs = "git status";
      ga = "git add *";
      gc = "git commit -m";
      gp = "git push origin master";

      # Editor
      shx = "sudoedit";
      shxc = "sudoedit /etc/nixos/configuration.nix";
      shxf = "sudoedit /etc/nixos/flake.nix";
      shxh = "sudoedit /etc/nixos/home.nix";
      shxn = "sudoedit /etc/nixos/config.kdl";
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
