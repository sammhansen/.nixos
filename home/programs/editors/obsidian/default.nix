{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.editors.obsidian;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
