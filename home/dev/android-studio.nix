{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.dev.ides.androidstd;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      android-studio
      gradle
      android-tools
      android-studio-tools
    ];
  };
}
