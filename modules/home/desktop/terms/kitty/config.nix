{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
        font = "Iosevka Term Nerd Font Complete Mono";
        bold_font = "auto";
        enable_audio_bell = false;
        font_size = 14;
        url_color ="#9ece6a";
        cursor_blink_interval = 0;
        copy_on_select = true;
        background_opacity = 0.60;
        window_padding_width = 10;
        extraConfig = "include theme.conf";
    };
  };
  # copy the custom theme: theme.conf to ~/.config/kitty
  # NOTE: you can use kitty.themeFile = "theme-here" from --> https://github.com/kovidgoyal/kitty-themes
  xdg.configFile."kitty/theme.conf".source = ./theme.conf;
}
