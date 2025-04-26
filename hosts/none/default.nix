{
  imports = [
    ./users.nix
    ./nvidia-drivers.nix
    ./nvidia-prime-drivers.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "nixos";
  boot.initrd.kernelModules = [ "amdgpu" "nvidia" "nvidia-drm" ];
}
