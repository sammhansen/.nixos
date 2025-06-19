{
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./cli
    ./git
    ./editors
    ./browsers
    ./media
    ./socials
    ./obs
    ./foot
  ];

  config = mkIf (!isServer) {
    home.packages = with pkgs; [
      qalculate-gtk
      gnome-calculator
      appflowy
      handbrake
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
  };
}
