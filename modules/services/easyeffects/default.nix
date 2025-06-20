{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib) mkIf mkMerge;
in {
  config = let
    cfg = bifrost.services.easyeffects;
  in
    mkMerge [
      (mkIf (cfg.enable) {
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
      })
      # (mkIf (!isServer && cfg.fixed-quantum.enable) {
      #   services.pipewire = {
      #     configPackages = [
      #       (pkgs.writeTextDir "share/pipewire/pipewire.conf.d/99-fixed-quantum.conf" ''
      #         context.properties = {
      #           default.clock.rate        = 48000;
      #           default.clock.quantum     = 1024;
      #           default.clock.min-quantum = 1024;
      #           default.clock.max-quantum = 1024;
      #         };
      #       '')
      #     ];
      #   };
      # })
    ];
}
