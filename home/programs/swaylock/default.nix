{
  bifrost,
  lib,
  ...
}: let
  cfg = bifrost.sessions.river;

  inherit (lib.modules) mkIf;
in {
  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
    };
  };
}
