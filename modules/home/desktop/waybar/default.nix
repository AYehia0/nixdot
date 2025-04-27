{
  programs.waybar = {
    enable = true;
  };

  xdg.configFile = {
    "waybar/config".source = ./config.jsonc;
    "waybar/style.css".source = ./style.css;
    "waybar/prayer.sh" = {
        source = ./prayer.sh;
        executable = true;
    };
  };
}
