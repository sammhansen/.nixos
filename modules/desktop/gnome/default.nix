{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.windowManager.gnome;

  layout = config.bifrost.device.keyLayout;
in {
  config = mkIf (!isServer && cfg.enable) {
    services = {
      xserver = {
        enable = true;
        videoDrivers = ["intel"];
        xkb = {
          layout = "${layout}";
          variant = "";
        };
        desktopManager = {
          gnome = {
            enable = true;
          };
        };
      };
    };
  };
}
