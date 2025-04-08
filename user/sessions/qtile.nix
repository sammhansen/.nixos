{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.qtile;
in {
  config = mkIf cfg.enable {
    services.xserver.windowManager.qtile = {
      enable = true;
    };
  };
}
