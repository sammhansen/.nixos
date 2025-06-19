{
  config,
  lib,
  pkgs,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost.windowManager.niri;
in {
  imports = [
    ./polkit
    ./portal
    ./xwayland
  ];

  config = mkIf (!isServer && cfg.enable) {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
    };

    environment.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };
}
