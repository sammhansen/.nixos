{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.dev.dbs.postgresql;
in {
  config = mkIf cfg.enable {
    services.postgresql = {
      enable = false;
      package = pkgs.postgresql_15;
      # dataDir = "/data/postgresql";
    };
  };
}
