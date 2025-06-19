{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.programs.git;
in {
  imports = [
    ./gh.nix
    ./lazygit.nix
    ./gh-dash.nix
  ];

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "${cfg.userName}";
      userEmail = "${cfg.userEmail}";
      delta = {
        enable = true;
        options = {
          navigate = true;
          side-by-side = true;
          line-numbers = true;
        };
      };

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
