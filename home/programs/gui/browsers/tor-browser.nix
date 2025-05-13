{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.browsers.tor-browser;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      tor-browser
    ];
  };
}
