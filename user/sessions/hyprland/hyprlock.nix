{lib, ...}: let
  monitor = "";
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        monitor = "${monitor}";
        path = lib.mkForce "~/nix/.config/wallpapers/Messy-Room.jpg";
        blur_passes = 0;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };
      label = [
        # TIME
        {
          monitor = "${monitor}";
          text = ''cmd[update:1000] echo "<span>$(date +"%I:%M")</span>"'';
          color = lib.mkForce "rgba(216, 222, 233, .7)";
          font_family = "Cartograph CF";
          font_size = 40;
          position = "40, 60";
          halign = "left";
          valign = "bottom";
        }

        # DATE
        {
          monitor = "${monitor}";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = lib.mkForce "rgba(216, 222, 233, .7)";
          font_family = "Cartograph CF Italic";
          font_size = 16;
          position = "30, 40";
          halign = "left";
          valign = "bottom";
        }
      ];

      # PASSWORD PROMPT
      input-field = {
        monitor = "${monitor}";
        size = "300, 60";
        outline_thickness = 2;
        rounding = 6;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.3; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = lib.mkForce "rgba(255, 255, 255, 0)";
        inner_color = lib.mkForce "rgba(255, 255, 255, 0.1)";
        font_color = lib.mkForce "rgb(200, 200, 200)";
        fade_on_empty = true;
        font_family = "SpaceMono Nerd Font";
        placeholder_text = "<i><span foreground='##ffffff99'>Enter Pass</span></i>";
        hide_input = false;
        position = "0, 0";
        halign = "center";
        valign = "center";
      };
    };
  };
}
