{
  bifrost,
  username,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.terminals.foot;
  font = {
    name = bifrost.themes.font.name;
    size = builtins.toString bifrost.themes.font.name;
  };

  colors = import ../../../../.local/state/matugen/colors.nix;

  stripHash = hex: builtins.substring 1 (builtins.stringLength hex) hex;
in {
  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          shell = "zellij";
          include = "/home/${username}/.local/foot/colors.ini";
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
          background = stripHash colors.background;
          foreground = stripHash colors.on_surface;
          regular0 = stripHash colors.surface;
          regular1 = stripHash colors.error;
          regular2 = stripHash colors.primary;
          regular3 = stripHash colors.tertiary;
          regular4 = stripHash colors.on_primary_container;
          regular5 = stripHash colors.on_secondary_container;
          regular6 = stripHash colors.secondary;
          regular7 = stripHash colors.on_surface;
          bright0 = stripHash colors.surface_bright;
          bright1 = stripHash colors.error;
          bright2 = stripHash colors.primary;
          bright3 = stripHash colors.tertiary;
          bright4 = stripHash colors.on_primary_container;
          bright5 = stripHash colors.on_secondary_container;
          bright6 = stripHash colors.secondary;
          bright7 = stripHash colors.on_surface;
          # dim0 = "45475A";
          # dim1 = "F38BA8";
          # dim2 = "A6E3A1";
          # dim3 = "F9E2AF";
          # dim4 = "89B4FA";
          # dim5 = "F5C2E7";
          # dim6 = "94E2D5";
          # dim7 = "BAC2DE";
          selection-foreground = stripHash colors.primary;
          selection-background = stripHash colors.on_primary;
        };

        key-bindings = {
          clipboard-copy = "Control+c";
          clipboard-paste = "Control+v";
          search-start = "Control+f";
          font-increase = "Control+plus Control+equal Control+KP_Add";
          font-decrease = "Control+minus Control+KP_Subtract";
          font-reset = "Control+0 Control+KP_0";
        };

        search-bindings = {
          cancel = "Escape";
          find-prev = "Shift+F3";
          find-next = "F3 Control+G";
        };
      };
    };
  };
}
