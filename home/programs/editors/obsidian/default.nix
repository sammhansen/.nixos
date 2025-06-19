{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.editors.obsidian;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
