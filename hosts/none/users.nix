{ pkgs, ... }:
{
  users = {
    users.none = {
      isNormalUser = true;
      description = "none";
      home = "/home/none";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "video"
        "input"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [ ];
    };
  };
  services.getty = {
    autologinUser = "none";
    helpLine = "You know what to do!";
  };
}
