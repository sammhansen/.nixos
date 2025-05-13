{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.browsers.chrome;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}
