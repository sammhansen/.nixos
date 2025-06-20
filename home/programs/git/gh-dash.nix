{
  lib,
  bifrost,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.git;
in {
  config = mkIf cfg.enable {
    programs.gh-dash = {
      enable = true;
    };
  };
}
