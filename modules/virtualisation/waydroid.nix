{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.virtualisation.waydroid;
in {
  config = mkIf cfg.enable {
    virtualisation = {
      waydroid = {
        enable = true;
      };
    };
  };
}
