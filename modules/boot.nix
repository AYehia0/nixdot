{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [
        "nvidia_drm.modeset=1"
        "nvidia_drm.fbdev=1"
        "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      ];
  };
}
