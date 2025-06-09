{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  cfg = bifrost.sessions.niri;

  inherit (lib.modules) mkIf;
in {
  config = mkIf cfg.enable {
    services.swayidle = {
      enable = true;
      package = pkgs.swayidle;
      systemdTarget = "graphical-session.target";
    };
  };
}
