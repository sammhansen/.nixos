{
  config,
  lib,
  pkgs,
  isServer,
  isNiri,
  ...
}: let
  inherit (lib) mkMerge mkIf;

  cfg = config.bifrost.programs.media;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [
        mpris
      ];

      config = mkMerge [
        {
          hwdec = "auto-safe";
          vo = "gpu";
          profile = "gpu-hq";
          ytdl-format = "bestvideo+bestaudio";
        }

        (mkIf isNiri {
          gpu-context = "wayland";
        })
      ];
    };
  };
}
