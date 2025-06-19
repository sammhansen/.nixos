{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.virtualisation.ollama;
in {
  config = mkIf cfg.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama;
    };
  };
}
