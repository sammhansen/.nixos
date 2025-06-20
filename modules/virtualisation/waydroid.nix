{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.virtualisation.waydroid;
in {
  config = mkIf (!isServer && cfg.enable) {
    virtualisation = {
      waydroid = {
        enable = true;
      };
    };
  };
}
