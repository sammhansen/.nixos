{
  lib,
  pkgs,
  bifrost,
  isServer,
  isWayland,
  isIntel,
  ...
}: let
  inherit (lib) optionals mkIf;

  cfg = bifrost.programs.obs;
  plugins = pkgs.obs-studio-plugins;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.obs-studio = {
      enable = true;
      plugins =
        [
          plugins.obs-gstreamer
        ]
        ++ (optionals isWayland [
          plugins.wlrobs
        ])
        ++ (optionals isIntel [
          plugins.obs-vaapi
          plugins.obs-vkcapture
        ]);
    };
  };
}
