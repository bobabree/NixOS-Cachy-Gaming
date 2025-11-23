# hosts/bree/system/programs/stylix.nix
{pkgs, ...}: {
  stylix = {
    enable = true;

    # Use Noctalia's colors via the symlink
    # Or set a static scheme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    # Enable automatic Home Manager integration
    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };

    # System-only targets
    targets = {
      console.enable = true; # TTY/virtual terminal colors
      grub.enable = true; # Bootloader theme (systemd-boot doesn't use this)
      nixos-icons.enable = true; # System icon theme
      plymouth.enable = true; # Boot splash screen
    };
  };
}
