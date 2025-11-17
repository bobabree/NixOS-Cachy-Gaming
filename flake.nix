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

  outputs = { nixpkgs, chaotic, home-manager, ... }: {
    nixosConfigurations = {
      bree = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          chaotic.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bree = import ./home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
  };
}
