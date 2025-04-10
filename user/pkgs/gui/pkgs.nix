{pkgs, ...}: {
  home.packages = with pkgs; [
    xfce.thunar
    # hakuneko
    walker
    blender
    davinci-resolve

    git
    gh-dash
    jq

    # easyeffects
    swww

    bitwarden-desktop
    gnome-control-center
    openvpn

    # papirus-icon-theme
    # bibata-cursors

    wlsunset

    nix-prefetch-git

    xdg-user-dirs

    brightnessctl
    cliphist
    wl-clipboard
    pavucontrol
    playerctl
    hyprshot

    #screenrecord script
    slurp
    wf-recorder

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

    nautilus
    yad

    libreoffice-fresh
  ];
}
