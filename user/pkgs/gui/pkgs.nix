{pkgs, ...}: {
  home.packages = with pkgs; [
    xfce.thunar
    blender
    kdePackages.kdenlive
    activitywatch
    hours
    eog

    git
    gh-dash
    jq

    # easyeffects
    swww

    bitwarden-desktop
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

    #screenrecord script
    # slurp
    # wf-recorder

    # btop
    eza
    # carapace
    # zoxide
    # delta
    bat
    fzf
    ripgrep
    tlrc
    zip
    unzip

    glib
    # ydotool
    file

    ani-cli
    manga-cli
    yt-dlp
    spotdl

    telegram-desktop
    element-desktop

    youtube-music

    (mpv.override {scripts = [mpvScripts.mpris];})
    vlc

    nautilus
    yad

    libreoffice-fresh
  ];
}
