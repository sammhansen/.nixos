{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.socials.telegram;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      ayugram-desktop
    ];
  };
}
