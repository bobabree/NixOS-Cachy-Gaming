# home/programs/helix.nix
{pkgs, ...}: {
  #===================================================================
  # TEXT EDITORS
  #===================================================================
  # https://helix-editor.vercel.app/configuration/editor
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
        mouse = false;

        # Enable middle-click paste
        # middle-click-paste = true;

        # Lines to scroll per scroll wheel step
        scroll-lines = 3;

        # Shell to use for external commands [command, args...]
        shell = ["fish" "-i" "-c"];

        # Line number display: "absolute" or "relative"
        # line-number = "relative";

        # Highlight all lines with cursor
        cursorline = true;

        # Highlight all columns with cursor
        # cursorcolumn = false;

        # Gutters to display: "diagnostics", "diff", "line-numbers", "spacer"
        gutters = ["diagnostics" "spacer" "line-numbers" "spacer" "diff"];

        # Auto-popup completion menu
        auto-completion = true;

        # Auto-format on save
        auto-format = true;

        # Milliseconds before idle timers trigger
        idle-timeout = 250;

        # Milliseconds after typing before showing completions
        completion-timeout = 250;

        # Apply completion instantly when selected
        preview-completion-insert = true;

        # Min word length to trigger autocompletion
        completion-trigger-len = 2;

        # Always replace entire word, not just part before cursor
        completion-replace = true;

        # Display info boxes
        auto-info = true;

        # Override terminal truecolor detection
        true-color = true;

        # Override terminal undercurl detection
        undercurl = true;

        # Column positions for rulers [80, 120]
        # rulers = [ ];

        # Show bufferline: "always", "never", or "multiple"
        bufferline = "always";

        # Color mode indicator differently per mode
        color-modes = true;

        # Max line length for :reflow and soft-wrapping
        # text-width = 80;

        # Directories treated as LSP roots (project-local only)
        # workspace-lsp-roots = [ ];

        # Line ending for new docs: "native", "lf", "crlf", "ff", "cr", "nel"
        # default-line-ending = "native";

        # Auto-insert trailing newline on save
        insert-final-newline = true;

        # Border style: "popup", "menu", "all", or "none"
        popup-border = "all";

        # Indentation computation: "simple", "tree-sitter", or "hybrid"
        indent-heuristic = "hybrid";

        # Characters for jump labels
        # jump-label-alphabet = "abcdefghijklmnopqrstuvwxyz";

        # Min diagnostic severity at line end: "disable", "hint", "info", "warning", "error"
        end-of-line-diagnostics = "hint";

        # Statusline configuration
        statusline = {
          left = [
            "mode" # NOR/INS/SEL
            "spinner" # LSP activity indicator
            #   "file-name"               # Current file name
            "file-absolute-path" # Full path /home/user/file.rs
            #   "file-base-name"          # Just filename without path
            "file-modification-indicator" # [+] if unsaved
            #   "read-only-indicator"     # [readonly] if can't write
            "version-control" # Git branch: main ✓
            #   "register"                # Currently selected register
          ];

          # center = [
          #   # Any element from above, or commonly:
          #   "file-type"               # Language: Rust, Python, Nix
          # ];

          right = [
            "diagnostics" # ❌ 2 ⚠ 5
            "workspace-diagnostics" # Errors across whole project
            #   "selections"              # 3 sel (multi-cursor count)
            #   "primary-selection-length"  # 15 chars selected
            "position" # Ln 42, Col 10
            "position-percentage" # 50% through file
            #   "total-line-numbers"      # Total lines in file
            #   "file-encoding"           # UTF-8
            #   "file-line-ending"        # LF or CRLF
            #   "file-type"               # Rust
            #   "separator"               # Just shows separator char
            #   "spacer"                  # Empty space (for alignment)
          ];

          separator = " │ ";
        };

        #
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
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };

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
          render = true;
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
          # Language scope for syntax highlighting
          scope = "source.rust";
          # Regex pattern for language injection in markdown/other files
          injection-regex = "rust";
          # File extensions this language applies to
          file-types = ["rs"];
          # Files that indicate project root directory
          roots = ["Cargo.toml" "Cargo.lock"];
          auto-format = true;
          language-servers = ["rust-analyzer"];
          # Indentation settings: 4 spaces per tab
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          formatter = {
            command = "rustfmt";
            args = ["--edition" "2021"];
          };

          # Debug Adapter Protocol (DAP) configuration
          debugger = {
            # Name of the debug adapter
            name = "lldb-dap";
            # Communication method: stdio or tcp
            transport = "stdio";
            # Command to launch the debugger
            command = "lldb-dap";

            # Debug session templates - define how to start debugging
            templates = [
              {
                # Template for debugging a compiled binary
                name = "binary";
                # Type of debug session: launch or attach
                request = "launch";
                # Prompt user for binary path when starting
                completion = [
                  {
                    name = "binary";
                    completion = "filename";
                  }
                ];
                # Arguments passed to debugger
                args = {program = "{0}";};
              }
              {
                # Template for attaching to running process
                name = "attach";
                request = "attach";
                # Prompt user for process ID
                completion = ["pid"];
                args = {pid = "{0}";};
              }
            ];
          };
        }
        {
          name = "cpp";
          scope = "source.cpp";
          injection-regex = "cpp";
          file-types = ["cc" "hh" "cpp" "hpp" "h" "ipp" "tpp" "cxx" "hxx"];
          # compile_commands.json contains build configuration for clangd
          roots = ["compile_commands.json" ".clangd"];
          auto-format = true;
          language-servers = ["clangd"];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          formatter = {
            command = "clang-format";
          };

          debugger = {
            name = "lldb-dap";
            transport = "stdio";
            command = "lldb-dap";

            templates = [
              {
                name = "binary";
                request = "launch";
                completion = [
                  {
                    name = "binary";
                    completion = "filename";
                  }
                ];
                # console setting controls where output appears
                args = {
                  console = "internalConsole";
                  program = "{0}";
                };
              }
              {
                name = "attach";
                request = "attach";
                completion = ["pid"];
                args = {
                  console = "internalConsole";
                  pid = "{0}";
                };
              }
            ];
          };
        }
        {
          name = "c";
          scope = "source.c";
          injection-regex = "c";
          file-types = ["c" "h"];
          roots = ["compile_commands.json" ".clangd"];
          auto-format = true;
          language-servers = ["clangd"];
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          formatter = {
            command = "clang-format";
          };

          debugger = {
            name = "lldb-dap";
            transport = "stdio";
            command = "lldb-dap";

            templates = [
              {
                name = "binary";
                request = "launch";
                completion = [
                  {
                    name = "binary";
                    completion = "filename";
                  }
                ];
                args = {
                  console = "internalConsole";
                  program = "{0}";
                };
              }
              {
                name = "attach";
                request = "attach";
                completion = ["pid"];
                args = {
                  console = "internalConsole";
                  pid = "{0}";
                };
              }
            ];
          };
        }
        {
          name = "python";
          scope = "source.python";
          injection-regex = "python|py";
          file-types = ["py" "pyi" "py3" "pyw"];
          # Recognize python shebang lines
          shebangs = ["python"];
          # Common Python project root indicators
          roots = ["pyproject.toml" "setup.py" "poetry.lock" "requirements.txt"];
          auto-format = true;
          # Multiple LSPs: ruff for linting/formatting, basedpyright for type checking
          language-servers = ["ruff" "basedpyright"];
          # Python standard: 4 spaces per indent level
          indent = {
            tab-width = 4;
            unit = "    ";
          };
          formatter = {
            command = "ruff";
            # "-" means read from stdin
            args = ["format" "-"];
          };

          # Python debugger using debugpy (Microsoft's Python debugger)
          debugger = {
            name = "debugpy";
            transport = "stdio";
            # Launch debugpy as a Python module
            command = "python3";
            args = ["-m" "debugpy.adapter"];

            templates = [
              {
                name = "source";
                request = "launch";
                # Prompt for Python file to debug
                completion = [
                  {
                    name = "entrypoint";
                    completion = "filename";
                    default = ".";
                  }
                ];
                # {0} will be replaced with the file path
                args = {program = "{0}";};
              }
            ];
          };
        }
        {
          name = "nix";
          scope = "source.nix";
          injection-regex = "nix";
          file-types = ["nix"];
          # Nix project root indicators
          roots = ["flake.nix" "shell.nix" "default.nix"];
          auto-format = true;
          language-servers = ["nixd"];
          # Nix standard: 2 spaces per indent level
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          formatter = {
            command = "alejandra";
          };
          # No debugger for Nix (it's a configuration language)
        }
      ];
    };

    extraPackages = with pkgs; [
      # Rust toolchain
      rust-analyzer # LSP server for Rust
      rustfmt # Code formatter
      lldb # LLVM debugger (debugs Rust, C, C++)

      # C/C++ toolchain
      clang-tools # Includes clangd LSP and clang-format

      # Python toolchain
      ruff # Fast linter and formatter with built-in LSP
      basedpyright # Type checker (fork of pyright)
      (python3.withPackages (ps:
        with ps; [
          pandas # Data analysis and manipulation (DataFrames)
          pandas-stubs # Type hints for pandas (better LSP support)
          numpy # Numerical computing and arrays
          torch # PyTorch deep learning framework
          debugpy # Debug adapter for Python debugging
        ]))

      # Nix toolchain
      nixd # Modern Nix LSP with better features
      alejandra # Fast Nix formatter
    ];
  };
}
