{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.socials.matrix;
in {
  config = mkIf (!isServer && cfg.package == "element") {
    programs.element-desktop = {
      enable = true;
    };
  };
}
