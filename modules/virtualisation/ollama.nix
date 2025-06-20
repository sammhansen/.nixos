{
  lib,
  pkgs,
  bifrost,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.virtualisation.ollama;
in {
  config = mkIf cfg.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama;
    };
  };
}
