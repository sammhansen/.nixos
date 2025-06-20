{
  lib,
  pkgs,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer && isWayland) {
    services.wlsunset = {
      enable = true;
      gamma = 0.8;
      temperature = {
        day = 6500;
        night = 3000;
      };
      sunrise = "06:30";
      sunset = "19:00";
      systemdTarget = "graphical-session.target";
    };
    home.packages = with pkgs; [
      wlsunset
    ];
  };
}
