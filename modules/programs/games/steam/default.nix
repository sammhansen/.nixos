{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.games.steam;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.steam = {
      enable = true;
    };
  };
}
