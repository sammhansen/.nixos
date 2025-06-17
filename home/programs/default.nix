{pkgs, ...}: {
  imports = [
    ./shell
    ./git
    ./editors
    ./browsers
    ./media
    ./socials
    # ./thunderbird
    ./obs
    ./foot
    ./distrobox
  ];
  home.packages = with pkgs; [
    # qalculate-gtk
    gnome-calculator
    # appflowy
    # handbrake
    zapzap
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
