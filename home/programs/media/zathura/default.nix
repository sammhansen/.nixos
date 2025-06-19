{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.media.zathura;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.zathura = {
      enable = true;
    };
  };
}
