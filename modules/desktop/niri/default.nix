{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.sessions.niri;
in {
  imports = [
    ./polkit
    ./portal
    ./xwayland
  ];

  config = mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    environment.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };
}
