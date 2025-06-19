{
  config,
  lib,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options = {
    bifrost = {
      LGBTheme = let
        username = config.user.username;
      in {
        lockscreen = mkOption {
          type = types.str;
          default = "/home/${username}/Pictures/wallpapers/nature-girl.jpg";
          description = "Path to hyprlock's wallpaper as a string";
        };
        font = {
          main = {
            name = mkOption {
              type = types.str;
              default = "SpaceMono Nerd Font";
              description = "font to use in rice & ui";
            };
            variant = mkOption {
              type = types.str;
              default = "Regular";
              description = ''
                font variants to be used
              '';
            };
          };
          size = mkOption {
            type = types.int;
            default = 11;
            description = "Font size to apply";
          };
          sans-serif = {
            name = mkOption {
              type = types.str;
              default = "SpaceMono Nerd Font";
              description = "Sans-serif font to use";
            };
            variant = mkOption {
              type = types.str;
              default = "Regular";
              description = ''
                font variants to be used
              '';
            };
          };
          mono-space = {
            name = mkOption {
              type = types.str;
              default = "SpaceMono Nerd Font";
              description = "Mono-space font to use";
            };
            variant = mkOption {
              type = types.str;
              default = "Regular";
              description = ''
                mono-space variant to use
              '';
            };
          };
        };
      };
    };
  };
}
