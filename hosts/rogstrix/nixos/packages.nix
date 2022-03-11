{ pkgs, ... }:

{
  # latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Nonfree software (because I am not a psychopath, or maybe I am)
  nixpkgs.config.allowUnfree = true;

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
        ark
        zathura
        sxiv
	cmatrix
	hollywood
	
        #developing
        neovim
        vim
        vscode
        docker

        #applications
        mpv
        xfce.thunar
        dolphin
        spotify
        firefox
        thunderbird
        pavucontrol
        qbittorrent
        discord
        spectacle
        #gnome.gnome-screenshot

        #productivity
        obs-studio
        audacity
        blender
        inkscape
        kdenlive
        krita
        gimp

        #ricing
        nordic
        zafiro-icons
	
	#virtualization
        libvirt
        virt-manager
 ];
}
