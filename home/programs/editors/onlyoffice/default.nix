{
  config,
  lib,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.programs.editors.onlyoffice;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.onlyoffice = {
      enable = true;
      settings = {
        UITheme = "theme-contrast-dark";
        editorWindowMode = false;
        forcedRtl = false;
        maximized = true;
        titlebar = "custom";
      };
    };
  };
}
