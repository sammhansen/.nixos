{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  touchpad = "pointer-2-7-SynPS/2_Synaptics_TouchPad";
  browser = bifrost.browsers.default;
  position = bifrost.monitors.inbuilt.position;
  terminal = bifrost.terminals.default;
  filemanager = bifrost.extra.filemanager;

  clipboard = pkgs.writeShellScriptBin "rofi-clipboard.sh" ''
    config="
    configuration{dmenu{display-name:\" \";}}
    window{width:440px; height:271px;}
    listview{scrollbar:false;}
    "
    themeDir="~/.config/rofi/launcher.rasi"

    cliphist list |
        rofi -dmenu -theme-str "''${config}" -theme "''${themeDir}" |
        cliphist decode |
        wl-copy
  '';

  colors = import ../../../.local/state/matugen/colors.nix;
  argbify = hex: "0xff${lib.strings.removePrefix "#" hex}";
in {
  wayland.windowManager.river = {
    enable = true;
    extraConfig = ''
      # wlr-randr --output eDP-1 --mode 1920x1080 --pos ${position.x},${position.y}
      # wlr-randr --output HDMI-A-2 --mode 1920x1080 --pos 0,0
      rivertile -view-padding 6 -outer-padding 6 &

      for i in $(seq 1 9); do
        tags=$((1 << ($i - 1)))

        # switch to tag--workspace?? (i)
        riverctl map normal Super $i set-focused-tags $tags

        # tag view with num -- move focused window to (i)
        riverctl map normal Super+Alt $i set-view-tags $tags

        # Super+Control+[1-9] to toggle focus of tag [0-8]
        riverctl map normal Super+Control $i toggle-focused-tags $tags

        # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
        riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
      done
    '';
    settings = {
      declare-mode = ["passthrough"];
      set-repeat = "50 300";
      input."${touchpad}" = {
        tap = true;
        "natural-scroll" = "enabled";
      };
      keyboard-layout = "us";
      focus-follows-cursor = "normal";

      background-color = argbify colors.background;
      border-width = "0";
      border-color-focused = argbify colors.primary_container;
      border-color-unfocused = argbify colors.secondary_container;

      default-layout = "rivertile";

      map = {
        normal = {
          "Super Q" = "close";
          "Super+Shift E" = "exit";
          # "Super J" = "focus-view next";
          # "Super K" = "focus-view previous";
          # "Super+Shift J" = "swap next";
          # "Super+Shift K" = "swap previous";
          "Super Period" = "focus-output next";
          "Super Comma" = "focus-output previous";
          "Super+Shift Period" = "send-to-output next";
          "Super+Shift Comma" = "send-to-output previous";
          "Super Return" = "zoom";
          # "Super H" = "send-layout-cmd rivertile \"main-ratio -0.05\"";
          # "Super L" = "send-layout-cmd rivertile \"main-ratio +0.05\"";
          # "Super+Shift H" = "send-layout-cmd rivertile \"main-count +1\"";
          # "Super+Shift L" = "send-layout-cmd rivertile \"main-count -1\"";
          "Super F" = "toggle-fullscreen";

          #apps
          # "Super A" = "spawn 'dmenu_run -c -l 20'";
          "Super A" = "spawn '${pkgs.rofi}/bin/rofi -show drun -theme ~/.config/rofi/launcher.rasi'";
          "Super Tab" = "spawn ${terminal}";
          "Super B" = "spawn ${browser}";
          "Super E" = "spawn ${filemanager}";
          "Alt C" = "spawn 'chromium --app=https://chatgpt.com'";
          "Alt B" = "spawn firefox";
          "Super V" = "spawn '${clipboard}/bin/rofi-clipboard.sh'";
          "Control+Shift S" = "spawn wlogout";
          "Super+Control T" = "spawn '${pkgs.waypaper}/bin/waypaper'";
          "Alt P" = "spawn 'swaync-client --toggle-panel'";

          "None XF86MonBrightnessUp" = "spawn 'brightnessctl set +5%'";
          "None XF86MonBrightnessDown" = "spawn 'brightnessctl set 5%-'";
          "None XF86Search" = "spawn blueberry";

          #media
          "None XF86AudioRaiseVolume" = "spawn 'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'";
          "None XF86AudioLowerVolume" = "spawn 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'";

          "None XF86AudioMute" = "spawn 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'";
          "None XF86AudioMicMute" = "spawn 'wpctl set-mute @DEFAULT_SOURCE@ toggle'";

          "None XF86AudioMedia" = "spawn 'playerctl play-pause'";
          "None XF86AudioPlay" = "spawn 'playerctl play-pause'";
          "None XF86AudioPrev" = "spawn 'playerctl previous'";
          "None XF86AudioNext" = "spawn 'playerctl next'";

          #focus window
          "Super H" = "focus-view left";
          "Super J" = "focus-view down";
          "Super K" = "focus-view up";
          "Super L" = "focus-view right";

          #resize window
          "Alt H" = "resize horizontal -100";
          "Alt J" = "resize vertical 100";
          "Alt K" = "resize vertical -100";
          "Alt L" = "resize horizontal 100";

          #snap window
          "Alt+Shift H" = "snap left";
          "Alt+Shift J" = "snap down";
          "Alt+Shift K" = "snap up";
          "Alt+Shift L" = "snap right";

          #move window
          "Super+Shift H" = "move left 100";
          "Super+Shift J" = "move down 100";
          "Super+Shift K" = "move up 100";
          "Super+Shift L" = "move right 100";

          "Super Space" = "toggle-float";
          "Super Up" = "send-layout-cmd rivertile \"main-location top\"";
          "Super Right" = "send-layout-cmd rivertile \"main-location right\"";
          "Super Down" = "send-layout-cmd rivertile \"main-location bottom\"";
          "Super Left" = "send-layout-cmd rivertile \"main-location left\"";
          "Super F11" = "enter-mode passthrough";
        };
        passthrough = {
          "Super F11" = "enter-mode normal";
        };
        locked = {
          "None XF86Eject" = "spawn 'eject -T'";
          "None XF86AudioRaiseVolume" = "spawn 'pamixer -i 5'";
          "None XF86AudioLowerVolume" = "spawn 'pamixer -d 5'";
          "None XF86AudioMute" = "spawn 'pamixer --toggle-mute'";
          "None XF86AudioMedia" = "spawn 'playerctl play-pause'";
          "None XF86AudioPlay" = "spawn 'playerctl play-pause'";
          "None XF86AudioPrev" = "spawn 'playerctl previous'";
          "None XF86AudioNext" = "spawn 'playerctl next'";
          "None XF86MonBrightnessUp" = "spawn 'brightnessctl set +5%'";
          "None XF86MonBrightnessDown" = "spawn 'brightnessctl set 5%-'";
        };
      };

      map-pointer = {
        normal = {
          "Super BTN_LEFT" = "move-view";
          "Super BTN_RIGHT" = "resize-view";
          "Super BTN_MIDDLE" = "toggle-float";
        };
      };

      spawn = [
        "'waybar &'"
        "'swaync &'"
        "'nm-applet &'"
        "'swww-daemon --format xrgb'"
        "'wl-paste --type text --watch cliphist store &'"
        "'wl-paste --type image --watch cliphist store &'"
        "'discord &'"
        "powermode-indicator"
      ];

      rule-add = {
        "-app-id" = {
          "'float*'" = {
            "-title" = {
              "'foo'" = "float";
            };
          };
          "'bar'" = "csd";
        };
      };
    };
  };
}
