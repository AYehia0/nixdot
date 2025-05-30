{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # packages that don't need configuration

    # social
    telegram-desktop

    # files
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler
    ffmpegthumbnailer

    # safety
    bitwarden
    keepassxc

    # dev
    gcc
    gnumake
    go
    nodejs_23
    yarn
    python3
    python312Packages.pip
    lua
    lazygit
    lazydocker
    docker
    vim
    vscode
    thefuck

    # cli
    distrobox
    yt-dlp
    gallery-dl
    ffmpeg-full
    ripgrep
    jq
    yq-go
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    zip
    xz
    unzip
    p7zip
    glow

    # system info
    btop
    fastfetch
    nitch
    gdu
    gparted
  ];
}
