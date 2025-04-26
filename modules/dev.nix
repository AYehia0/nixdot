{ pkgs, ... }:
{
  environment = {
      variables = {
        GOPATH = "/home/none/.local/share/go";
        GOBIN = "/home/none/.local/share/go/bin";
      };
      sessionVariables = {
          WLR_NO_HARDWARE_CURSORS = "1";     # Fix cursor lag
          LIBVA_DRIVER_NAME = "nvidia";
          __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          GBM_BACKEND = "nvidia-drm";
          __GL_VRR_ALLOWED = "1";            # For VRR support if monitors allow
          WLR_RENDERER_ALLOW_SOFTWARE = "1";
          WLR_EGL_NO_MODIFIERS = "1";
    };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  programs.adb.enable = true;
  users.users.none.extraGroups = [ "adbusers" ];
  services.udev.packages = [ pkgs.android-udev-rules ];
}
