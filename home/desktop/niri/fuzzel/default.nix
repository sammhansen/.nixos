{
  isServer,
  isNiri,
  colors,
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost;
  terminal = cfg.programs.terminal.default;
  font = cfg.LGBTheme.font.main.name;

  rgbafy = hex: "${lib.strings.removePrefix "#" hex}ff";
in {
  imports = [
    ./emoji.nix
    ./powermenu.nix
  ];
  config = mkIf (!isServer && isNiri) {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "${font}";
          prompt = "";
          placeholder = "";
          icons-enabled = "no";
          terminal = "${terminal} -e";
          layer = "overlay";
        };

        colors = {
          background = rgbafy colors.background.hex;
          text = rgbafy colors.outline.hex;
          selection = rgbafy colors.primary_container.hex;
          selection-text = rgbafy colors.outline.hex;
          selection-match = rgbafy colors.on_primary_container.hex;
          match = rgbafy colors.on_primary_container.hex;
          prompt = rgbafy colors.outline.hex;
          placeholder = rgbafy colors.outline.hex;
          input = rgbafy colors.primary.hex;
          counter = rgbafy colors.secondary.hex;
          border = rgbafy colors.surface_container.hex;
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
  };
}
