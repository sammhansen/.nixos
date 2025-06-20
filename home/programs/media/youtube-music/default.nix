{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.media.yt-music;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      youtube-music
    ];
  };
}
