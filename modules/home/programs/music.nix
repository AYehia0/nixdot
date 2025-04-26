{ pkgs, ... }:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "pipewire output"
        }
        auto_update "yes"
        restore_paused "yes"
      '';
    };
    mpd-mpris.enable = true;
  };

  home.packages = with pkgs; [
    mpc
    mpdscribble
    rmpc
  ];
}
