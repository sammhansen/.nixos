{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.socials.whatsapp;
  package = cfg.package;
in {
  config = mkIf (!isServer && cfg.enable) {
    home.packages = [
      package
    ];
  };
}
