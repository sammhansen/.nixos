{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.browsers.firefox;
in {
  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles.default = {
        isDefault = true;
      };
    };
  };
}
