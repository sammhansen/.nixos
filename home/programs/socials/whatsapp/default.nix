{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.socials.whatsapp;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      zapzap
    ];
  };
}
