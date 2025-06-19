{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.virtualisation.bottles;
in {
  config = mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      bottles
    ];
  };
}
