{
  bifrost,
  lib,
  system,
  inputs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.browsers.zen;
in {
  config = mkIf cfg.enable {
    home.packages = [
      inputs.zen-browser.packages."${system}".twilight
    ];
  };
}
