{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.dev.langs.flutter;
in {
  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        # dart
        flutter
      ];

      sessionVariables = {
        CHROME_EXECUTABLE = pkgs.google-chrome;
      };
    };
  };
}
