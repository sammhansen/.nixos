{
  config,
  lib,
  isServer,
  isNiri,
  colors,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.programs.terminals.foot;
  font = {
    name = config.bifrost.LGBTheme.font.mono-space.name;
    size = builtins.toString config.bifrost.LGBTheme.font.size;
  };

  stripHash = hex: builtins.substring 1 (builtins.stringLength hex) hex;
in {
  config = mkIf (!isServer && isNiri && cfg.enable) {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          shell = "tmux";
          term = "xterm-256color";
          title = "foot";
          font = "${font.name}:size=11";
          # line-height = 13.5;
          letter-spacing = 0;
          selection-target = "clipboard";
          dpi-aware = "no";
          pad = "5x5 center";
        };
        cursor = {
          style = "beam";
          blink = "no";
        };
        desktop-notifications = {
          command = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        };

        bell = {
          command-focused = "no";
          notify = "no";
          urgent = "no";
        };

        colors = {
          alpha = 0.7;
          background = stripHash colors.background.hex;
          foreground = stripHash colors.on_surface.hex;
          regular0 = stripHash colors.surface.hex;
          regular1 = stripHash colors.error.hex;
          regular2 = stripHash colors.primary.hex;
          regular3 = stripHash colors.tertiary.hex;
          regular4 = stripHash colors.on_primary_container.hex;
          regular5 = stripHash colors.on_secondary_container.hex;
          regular6 = stripHash colors.secondary.hex;
          regular7 = stripHash colors.on_surface.hex;
          bright0 = stripHash colors.surface_bright.hex;
          bright1 = stripHash colors.error.hex;
          bright2 = stripHash colors.primary.hex;
          bright3 = stripHash colors.tertiary.hex;
          bright4 = stripHash colors.on_primary_container.hex;
          bright5 = stripHash colors.on_secondary_container.hex;
          bright6 = stripHash colors.secondary.hex;
          bright7 = stripHash colors.on_surface.hex;
          # dim0 = "45475A";
          # dim1 = "F38BA8";
          # dim2 = "A6E3A1";
          # dim3 = "F9E2AF";
          # dim4 = "89B4FA";
          # dim5 = "F5C2E7";
          # dim6 = "94E2D5";
          # dim7 = "BAC2DE";
          selection-foreground = stripHash colors.primary.hex;
          selection-background = stripHash colors.on_primary.hex;
        };

        key-bindings = {
          clipboard-copy = "Control+c";
          clipboard-paste = "Control+v";
          font-increase = "Control+plus Control+equal Control+KP_Add";
          font-decrease = "Control+minus Control+KP_Subtract";
          font-reset = "Control+0 Control+KP_0";
        };
      };
    };
  };
}
