{
  bifrost,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.programs.browsers.floorp;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.floorp = {
      enable = true;
    };
  };
}
