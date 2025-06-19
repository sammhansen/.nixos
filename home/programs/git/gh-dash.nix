{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.git;
in {
  config = mkIf cfg.enable {
    programs.gh-dash = {
      enable = true;
    };
  };
}
