{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.programs.browsers.tor-browser;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      tor-browser
    ];
  };
}
