{pkgs, ...}: let
in {
  home.packages = with pkgs; [
    youtube-music
  ];
}
