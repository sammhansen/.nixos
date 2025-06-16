{pkgs, ...}: {
  imports = [
    ./shell
    ./git
    ./editors
    ./browsers
    ./media
    ./socials
    ./thunderbird
    ./obs
    ./foot
  ];
  home.packages = with pkgs; [
    qalculate-gtk
    gnome-calculator
    appflowy
    handbrake
    zapzap
    whatsie
    whatsapp-for-linux

    moodle-dl
    eog
    bitwarden-desktop
    nix-prefetch-git
    xdg-user-dirs
    pavucontrol
    playerctl
    zip
    unzip
    glib
    file
    ani-cli
    yt-dlp
    spotdl
    yad
  ];
}
