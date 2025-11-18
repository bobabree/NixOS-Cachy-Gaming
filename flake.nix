{
  description = "Bree";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    chaotic,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      bree = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
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

          # =====================================================
          # HOME MANAGER (USER CONFIGURATION)
          # =====================================================
          home-manager.nixosModules.home-manager
          {
            # Use system-wide nixpkgs for consistency
            home-manager.useGlobalPkgs = true;

            # Install packages to /etc/profiles instead of ~/.nix-profile
            home-manager.useUserPackages = true;

            # Backup existing files when home-manager would overwrite them
            home-manager.backupFileExtension = "backup";

            # User configuration for 'bree'
            home-manager.users.bree = {
              imports = [
                # Base user settings (username, home directory, packages)
                ./hosts/bree/home.nix

                # User programs (helix, alacritty, fish, git, etc.)
                # All managed via home/programs/default.nix
                # This directory is PORTABLE across different machines
                ./home/programs
              ];
            };
          }
        ];
      };
    };
  };
}
