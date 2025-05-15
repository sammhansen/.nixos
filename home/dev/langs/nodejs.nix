{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.dev.langs.nodejs;
in {
  config = mkIf cfg.enable {
    home.packages = with pkgs;
    with nodePackages; [
      ts-node
      nodejs
    ];
  };
}
