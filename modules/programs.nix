{ pkgs, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    zsh.enable = true;
    zoxide = {
        enable = true;
        enableZshIntegration = true;
    };
    java.enable = true;
    nix-ld.enable = true;
    kdeconnect.enable = true;
  };
}
