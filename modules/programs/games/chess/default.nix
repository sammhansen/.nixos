{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.games.chess;
in {
  config = mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      gnome-chess
      stockfish
    ];
  };
}
