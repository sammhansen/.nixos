{
  bifrost,
  lib,
  ...
}: let
  cfg = bifrost.sessions.river;

  inherit (lib.modules) mkIf;
in {
  config = mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      systemdTarget = "river-session.target";
    };
  };
}
