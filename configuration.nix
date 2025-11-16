{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_cachyos.cachyOverride { mArch = "GENERIC_V3"; };
  services.scx.enable = true; 

  # Networking options
  networking.hostName = "bree";
  networking.networkmanager.enable = true;  

  # Time zone.
  time.timeZone = "America/Los_Angeles";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound.
  services.pulseaudio.enable = false;
  # OR
  services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
  };
  security.rtkit.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

  # Define user account
  users.users.bree = { 
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  #nixpkgs.overlays = [
  #    (self: super: {
  #      stdenv = super.stdenv.override {
  #        cc = super.stdenv.cc.override {
  #          extraFlags = [ "-march=native" ];
  #        };
  #      };
  #    })
  #];

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
     alacritty
     fish
     # firefox_nightly
     # fuzzel
     git
     # niri
     # noctalia-shell
     # swaybg
     vim
     # xwayland-satellite
   ];

  fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
  ];

  programs.fish.enable = true;
  users.users.bree.shell = pkgs.fish;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05"; # Did you read the comment?

}

