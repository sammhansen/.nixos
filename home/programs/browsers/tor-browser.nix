{
  isServer,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.programs.browsers.tor-browser;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      tor-browser
    ];
  };
}
