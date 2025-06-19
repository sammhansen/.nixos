{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;

  cfg = config.bifrost.virtualisation.podman;
in {
  config = mkMerge [
    (mkIf (!isServer) {
      environment.systemPackages = with pkgs; [
        podman-desktop
      ];
    })
    (mkIf cfg.enable {
      virtualisation = {
        podman = {
          enable = true;
          dockerCompat = false;
          defaultNetwork.settings.dns_enabled = false;
        };
      };
    })
  ];
}
