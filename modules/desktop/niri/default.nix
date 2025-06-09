{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.sessions.niri;
in {
  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
    };
  };
}
