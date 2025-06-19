{
  isServer,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  flakeDir = config.bifrost.device.flakeDir;
  templates = ./templates;

  settings = ''
    [config.wallpaper]
    command = "${pkgs.swww}/bin/swww"
    arguments = ["img", "--transition-type", "center"]
    set = true

    [templates.nvim]
    input_path = '~/.config/matugen/templates/nvim.lua'
    output_path = '~/.local/state/nvim/colors.lua'

    [templates.colors]
    input_path = '~/.config/matugen/templates/colors.nix'
    output_path = '${flakeDir}/.colors.nix'
  '';
in {
  config = mkIf (!isServer) {
    home.packages = with pkgs; [
      matugen
    ];

    xdg.configFile = {
      "matugen/config.toml".text = settings;
      "matugen/templates" = {
        recursive = true;
        source = "${templates}";
      };
    };
  };
}
