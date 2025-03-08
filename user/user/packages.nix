{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    gh-dash
    jq

    easyeffects
    mousai
    swww

    bitwarden-desktop
    gnome-control-center
    amnezia-vpn
    kronosnet
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
    carapace
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
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })

    youtube-music

    (mpv.override {scripts = [mpvScripts.mpris];})

    nautilus
    yad

    libreoffice-fresh
  ];
}
