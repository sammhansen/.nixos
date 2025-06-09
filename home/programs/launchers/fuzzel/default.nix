{
  bifrost,
  lib,
  ...
}: let
  colors = import ../../../../.local/state/matugen/colors.nix;

  terminal = bifrost.terminals.default;

  rgbafy = hex: "${lib.strings.removePrefix "#" hex}ff";
in {
  imports = [
    ./emoji.nix
  ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "${bifrost.themes.font.name}";
        prompt = "\" \"";
        placeholder = "Search";
        icons-enabled = "no";
        terminal = "${terminal} -e";
        layer = "overlay";
      };

      colors = {
        background = rgbafy colors.background;
        text = rgbafy colors.outline;
        selection = rgbafy colors.primary_container;
        selection-text = rgbafy colors.outline;
        selection-match = rgbafy colors.on_primary_container;
        match = rgbafy colors.on_primary_container;
        prompt = rgbafy colors.outline;
        placeholder = rgbafy colors.outline;
        input = rgbafy colors.primary;
        counter = rgbafy colors.secondary;
        border = rgbafy colors.surface_container;
      };

      border = {
        width = 1;
        radius = 3;
      };

      dmenu = {
        exit-immediately-if-empty = "yes";
      };
    };
  };
}
