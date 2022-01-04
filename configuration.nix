{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Systemd boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # timezone
  time.timeZone = "Europe/Bucharest";

  # networkmanager
  networking.hostName = "rogstrix"; 
  networking.networkmanager.enable = true;
  
  # Locale
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  

  # Nonfree software (because I am not a psychopath, or maybe I am)
  nixpkgs.config.allowUnfree = true;

  # Nvidia drivers
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime.sync.allowExternalGpu = true;
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.prime.nvidiaBusId = "PCI:10:0:0";
  hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
  services.xserver.videoDrivers = ["nvidia" ];
  services.xserver.dpi = 96;

  # Enable OpenGL
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [
    libva
    vaapiIntel
  ];

  # Enable Docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  virtualisation.podman = {
    enable = true;
    enableNvidia = true;
  };
  
  #virtualbox
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  
  #qemu
  virtualisation.libvirtd.enable = true;

  # X11
  services.xserver.enable = true;
  
  # Plasma 5
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Gnome
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #pulseaudio
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true; 
 
  # Touchpad support 
  services.xserver.libinput.enable = true;

  # User 
  users.users.hipster = {
    isNormalUser = true;
    initialPassword = "johnydeep";
    extraGroups = [ "wheel" ]; 
  };

  environment.systemPackages = with pkgs; [
        #terminal utils / applications
        git
	wget
	curl
	htop
        ranger
        tmux
	pfetch
        neofetch
	alacritty
	rustup
	cmake
	openssl

        #developing
        neovim
        vim
        emacs
        vscode
        docker

        #applications
        mpv
        spotify
        firefox
	chromium
        thunderbird
        pavucontrol
        discord
	gnome.gnome-screenshot

	#ricing
	nordic

	#gnome
	gnome3.gnome-tweak-tool
        gnomeExtensions.appindicator
        gnomeExtensions.dash-to-dock
	
	#virtualization
	libvirt
        virt-manager
  ];

  programs.dconf.enable = true;

  system.stateVersion = "21.11"; 

}
