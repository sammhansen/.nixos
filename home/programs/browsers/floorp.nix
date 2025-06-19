{
  isServer,
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.programs.browsers.floorp;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.floorp = {
      enable = true;
    };
  };
}
