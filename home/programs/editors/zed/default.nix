{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.programs.editors.zed;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "discord-presence"
      ];
      extraPackages = with pkgs; [
        nixd
      ];
      userSettings = {
        features = {
          copilot = false;
        };
        telemetry = {
          metrics = false;
        };
        vim_mode = false;
        ui_font_size = 16;
        buffer_font_size = 16;
        theme = {
          mode = "system";
          light = "One Dark";
          dark = "One Dark";
        };
      };
    };
  };
}
