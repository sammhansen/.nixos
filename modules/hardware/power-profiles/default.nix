{
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer) {
    services.power-profiles-daemon = {
      enable = true;
      package = pkgs.power-profiles-daemon;
    };

    environment.systemPackages = with pkgs; [
      powermode-indicator
    ];
  };
}
