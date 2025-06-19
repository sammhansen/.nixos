{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.games.chess;
in {
  config = mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      gnome-chess
      stockfish
    ];
  };
}
