{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.media.zathura;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.zathura = {
      enable = true;
    };
  };
}
