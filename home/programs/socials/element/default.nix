{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.socials.matrix;
in {
  config = mkIf (!isServer && cfg.package == pkgs.element-desktop) {
    programs.element-desktop = {
      enable = true;
    };
  };
}
