{
  config,
  pkgs,
  ...
}: {
  imports = [./scripts/power-menu.nix];
  xdg.configFile = {
    "rofi/themes/default.rasi".source = ./themes/default.rasi;
    "rofi/themes/power-menu.rasi".source = ./themes/power-menu.rasi;
    "rofi/style.rasi" = with config.lib.stylix.colors; {
      source = pkgs.writeText "my-css" ''
        * {
            background:            #${base00};
            background-alt:        #${base01};
            primary:               #${base0C};
            primary-foreground:    #${base00};
            foreground:            #${base05};
            active:                #${base07};
            selected:              #${base02};
            selected-foreground:   #${base07};
            prompt-icon:           #${base0C};
        }
        /* vim:ft=css
      '';
    };
    "rofi/font.rasi".source = pkgs.writeText "font-rasi" ''
      configuration {
        font: "${config.stylix.fonts.serif.name} Medium 11";
      }
    '';
  };
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
}
