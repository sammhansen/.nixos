{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;

  cfg = bifrost.virtualisation.podman;
in {
  config = mkMerge [
    (mkIf (!isServer && cfg.gui) {
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
