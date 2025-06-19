{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.media.yt-music;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      youtube-music
    ];
  };
}
