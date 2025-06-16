{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.browsers.floorp;
in {
  config = mkIf cfg.enable {
    programs.floorp = {
      enable = true;
    };
  };
}
