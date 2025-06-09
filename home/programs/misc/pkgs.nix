{pkgs, ...}: {
  home.packages = with pkgs; [
    blender
    kdePackages.kdenlive
    eog

    git
    gh-dash
    jq

    # easyeffects

    bitwarden-desktop
    bitwarden-cli

    gnome-control-center
    openvpn

    nix-prefetch-git

    xdg-user-dirs

    brightnessctl
    cliphist
    wl-clipboard
    pavucontrol
    playerctl
    hyprshot

    eza
    bat
    fzf
    ripgrep
    tlrc
    zip
    unzip

    glib
    file

    ani-cli
    manga-cli
    yt-dlp
    spotdl

    telegram-desktop
    element-desktop

    vlc

    yad
  ];
}
