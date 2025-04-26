{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./terms
    ./fuzzel.nix
    ./gtk.nix
    ./hyprland
    ./waybar
  ];

  services = {
    network-manager-applet.enable = true;
  };

  home.packages = with pkgs; [
    libnotify
    grim
    slurp
    wl-clipboard
    pavucontrol
    pamixer
    playerctl
    brightnessctl
  ];
}
