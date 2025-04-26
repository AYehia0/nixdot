{
  services.hyprpaper = {
    enable = true;
    settings = {
        splash = false;
        preload = [
          "~/.dotfiles/modules/home/desktop/hyprland/wallpaper/mima-1080.png"
          "~/.dotfiles/modules/home/desktop/hyprland/wallpaper/mima-1440.png"
        ];
        wallpaper = [
          "eDP-1,~/.dotfiles/modules/home/desktop/hyprland/wallpaper/mima-1080.png"
          "HDMI-A-1,~/.dotfiles/modules/home/desktop/hyprland/wallpaper/mima-1440.png"
        ];
    };
  };
}
