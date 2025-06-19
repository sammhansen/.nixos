{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.media.amberol;
in {
  config = mkIf (!isServer && cfg.enable) {
    services.amberol = {
      enable = true;
      enableRecoloring = false;
      replaygain = "track";
    };
  };
}
