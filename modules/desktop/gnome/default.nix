{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.windowManager.gnome;
in {
  config = mkIf (!isServer && cfg.enable) {
    services = {
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
    };
  };
}
