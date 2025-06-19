{
  config,
  lib,
  pkgs,
  isServer,
  isNiri,
  isIntel,
  ...
}: let
  inherit (lib.modules) optionals mkIf;

  cfg = config.bifrost.programs.obs;
  plugins = pkgs.obs-studio-plugins;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.obs-studio = {
      enable = true;
      plugins =
        [
          plugins.obs-gstreamer
        ]
        ++ (optionals isNiri [
          plugins.wlrobs
        ])
        ++ (optionals isIntel [
          plugins.obs-vaapi
          plugins.obs-vkcapture
        ]);
    };
  };
}
