{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.virtualisation.docker;
in {
  config = mkIf cfg.enable {
    virtualisation = {
      docker = {
        enable = true;
      };
    };
  };
}
