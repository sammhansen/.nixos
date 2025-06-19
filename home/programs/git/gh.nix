{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.git;
in {
  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;

      extensions = with pkgs; [
        gh-copilot
        gh-eco
      ];

      settings = {
        git_protocol = "ssh";
        prompt = "enabled";
      };
    };
  };
}
