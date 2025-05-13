{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.dev.dbs.mysql;
in {
  config = mkIf cfg.enable {
    services.mysql = {
      enable = false;
      package = pkgs.mariadb;
    };

    environment.systemPackages = with pkgs; [
      # mysql-workbench
    ];
  };
}
