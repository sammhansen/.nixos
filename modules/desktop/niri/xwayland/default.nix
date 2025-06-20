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
    systemd = {
      user.services.xwayland-satellite = {
        description = "xwayland-satellite";
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };

        wantedBy = ["graphical-session.target"];
        wants = ["graphical-session.target"];
        after = ["graphical-session.target"];
      };
    };
  };
}
