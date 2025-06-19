{
  lib,
  pkgs,
  isNiri,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer && isNiri) {
    security = {
      polkit.enable = true;
    };

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "Gnome PolicyKit agent";
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
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
