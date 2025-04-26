{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      obs-backgroundremoval
    ];
  };

  home.packages = with pkgs; [
    (discord.override {
      withVencord = true;
    })
    obsidian
    kdePackages.kdenlive
    qbittorrent
    vlc
  ];
}
