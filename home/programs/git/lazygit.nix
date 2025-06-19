{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.git;
in {
  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;

      settings = {
        update.method = "never";

        gui = {
          nerdFontsVersion = 3;
          authorColors."${cfg.userName}" = "#f5c2e7";
        };

        git.paging = {
          colorArg = "always";
          pager = "delta --paging=never";
        };
      };
    };
  };
}
