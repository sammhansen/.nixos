{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = let
    cfg = config.bifrost.services.easyeffects;
  in
    mkIf cfg.enable {
      services.pipewire = mkIf cfg.fixed-quantum.enable {
        configPackages = [
          (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/99-fixed-quantum.conf" ''
            context.properties = {
              default.clock.rate        = 48000;
              default.clock.quantum     = 1024
              default.clock.min-quantum = 1024
              default.clock.max-quantum = 1024
            }
          '')
        ];
      };

      systemd = {
        user.services.easyeffects = {
          description = "easyeffects";
          wantedBy = ["graphical-session.target"];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
            ExecStop = "${pkgs.easyeffects}/bin/easyeffects --quit";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
        };
      };
      environment.systemPackages = with pkgs; [
        easyeffects
      ];
    };
}
