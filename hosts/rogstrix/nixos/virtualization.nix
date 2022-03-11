{ config, pkgs, ... }:

{
  # Enable Docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  virtualisation.podman = {
    enable = true;
    enableNvidia = true;
  };

  # virtualbox
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;

  # qemu
  virtualisation.libvirtd.enable = true;
}
