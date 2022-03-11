{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./virtualization.nix
      ./desktop.nix
      ./packages.nix 
      ./drivers.nix
      ./fonts.nix
      ./user.nix
    ];

  # Systemd boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # networkmanager
  networking.hostName = "rogstrix"; 
  networking.networkmanager.enable = true;
    
  # pulseaudio
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true; 
 
  # Touchpad support 
  services.xserver.libinput.enable = true;

  programs.dconf.enable = true;

  system.stateVersion = "21.11"; 

}
