{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  cfg = bifrost.sessions.river;

  # dehexify = hex: builtins.strip

  inherit (lib.modules) mkIf;
in {
  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        color = "808080";
        font-size = 24;
        indicator-idle-visible = false;
        indicator-radius = 100;
        line-color = "ffffff";
        show-failed-attempts = true;
      };
    };
  };
}
