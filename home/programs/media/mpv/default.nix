{
  lib,
  pkgs,
  bifrost,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib) mkMerge mkIf;

  cfg = bifrost.programs.media.mpv;
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

        (mkIf isWayland {
          gpu-context = "wayland";
        })
      ];
    };
  };
}
