{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.virtualisation.waydroid;
in {
  config = mkIf (!isServer && cfg.enable) {
    virtualisation = {
      waydroid = {
        enable = true;
      };
    };
  };
}
