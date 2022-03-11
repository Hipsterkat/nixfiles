{ lib, pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in

{
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime.sync.allowExternalGpu = true;
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.prime.nvidiaBusId = "PCI:10:0:0";
  hardware.nvidia.prime.intelBusId = "PCI:0:2:0";
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

  # X11
  services.xserver.enable = true;

  services.xserver.videoDrivers = lib.mkDefault [ "nvidia" ];
  environment.systemPackages = [ nvidia-offload ];
}
