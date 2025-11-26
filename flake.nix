{
  description = "Bree";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    niri.url = "github:sodiboo/niri-flake";
    nur.url = "github:nix-community/NUR";
    stylix.url = "github:nix-community/stylix";
    nixcord = {
      url = "github:KaylorBen/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    chaotic,
    niri,
    nixcord,
    noctalia,
    nur,
    stylix,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      bree = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit self inputs;};
        modules = [
          # =====================================================
          # HOST-SPECIFIC CONFIGURATION
          # =====================================================
          # Core host settings and hardware detection
          ./hosts/bree/configuration.nix
          ./hosts/bree/hardware-configuration.nix

          # System modules (boot, networking, audio, graphics, overlays)
          # All managed via hosts/bree/system/default.nix
          ./hosts/bree/system

          # =====================================================
          # EXTERNAL MODULES
          # =====================================================
          # CachyOS kernel and optimizations
          chaotic.nixosModules.default
          # NUR (Nix User Repository) - Community packages not in nixpkgs
          {
            nixpkgs.overlays = [nur.overlays.default];
          }

          # Strategy: Stylix themes system/CLI
          stylix.nixosModules.stylix

          # =====================================================
          # HOME MANAGER (USER CONFIGURATION)
          # =====================================================
          home-manager.nixosModules.home-manager
          {
            # Use system-wide nixpkgs for consistency
            home-manager.useGlobalPkgs = true;

            # Install packages to /etc/profiles instead of ~/.nix-profile
            home-manager.useUserPackages = true;

            # Backup conflicting files
            home-manager.backupFileExtension = "backup";

            # Pass to home manager too
            home-manager.extraSpecialArgs = {inherit inputs;};

            # User configuration for 'bree'
            home-manager.users.bree = {
              imports = [
                # Base user settings (username, home directory, packages)
                ./hosts/bree/home.nix

                # User programs (helix, alacritty, fish, git, etc.)
                # All managed via home/programs/default.nix
                # This directory is PORTABLE across different machines
                ./home/programs

                nixcord.homeModules.nixcord # Discord
              ];
            };
          }
        ];
      };
    };
  };
}
