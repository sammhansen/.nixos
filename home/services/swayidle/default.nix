{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  cfg = bifrost.sessions.river;

  inherit (lib.modules) mkIf;
in {
  config = mkIf cfg.enable {
    services.swayidle = {
      package = pkgs.swaylock-effects;
      enable = true;
      systemdTarget = "river-session.target";
    };
  };
}
