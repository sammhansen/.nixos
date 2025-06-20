{
  lib,
  bifrost,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost;

  lock-wallpaper = cfg.LGBTheme.lockscreen;
  font-primary = cfg.LGBTheme.font.main.name;
  font-sans-serif = cfg.LGBTheme.font.sans-serif.name;
  monitor = "";
in {
  config = mkIf (!isServer && isWayland) {
    programs.hyprlock = {
      enable = true;
      settings = {
        background = {
          monitor = "${monitor}";
          path = "${lock-wallpaper}";
          blur_passes = 0;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        };
        general = {
          grace = 0;
        };
        label = [
          {
            monitor = "${monitor}";
            text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
            color = "rgba(216, 222, 233, .7)";
            font_family = "${font-primary}";
            font_size = 40;
            position = "40, 60";
            halign = "left";
            valign = "bottom";
          }

          {
            monitor = "${monitor}";
            text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
            color = "rgba(216, 222, 233, .7)";
            font_family = "${font-sans-serif}";
            font_size = 16;
            position = "30, 40";
            halign = "left";
            valign = "bottom";
          }
        ];

        input-field = {
          monitor = "${monitor}";
          size = "300, 60";
          outline_thickness = 2;
          rounding = 6;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.3; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(255, 255, 255, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = true;
          font_family = "${font-primary}";
          placeholder_text = "<i><span foreground='##ffffff99'>Enter Pass</span></i>";
          hide_input = false;
          position = "0, 0";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
