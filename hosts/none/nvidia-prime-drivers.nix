{ lib, pkgs, ... }:
{
    hardware.nvidia.prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:5:0:0";
        nvidiaBusId = "PCI:1:0:0";
    };

  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      exec "$@"
    '')
  ];
}