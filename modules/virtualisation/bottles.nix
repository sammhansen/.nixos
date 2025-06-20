{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.virtualisation.bottles;
in {
  config = mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      bottles
    ];
  };
}
