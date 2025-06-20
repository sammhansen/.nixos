{
  lib,
  bifrost,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.virtualisation.docker;
in {
  config = mkIf cfg.enable {
    virtualisation = {
      docker = {
        enable = true;
      };
    };
  };
}
