{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.hyprland;
in {
  imports = [
    ./notifications.nix
    ./control-center.nix
  ];

  config = mkIf cfg.enable {
    services.swaync = {
      enable = true;
      settings = {
        positionX = "right";
        positionY = "top";
        cssPriority = "user";
        control-center-width = 350;
        control-center-margin-top = 4;
        control-center-margin-bottom = 4;
        control-center-margin-right = 4;
        control-center-margin-left = 4;
        notification-window-width = 350;
        notification-icon-size = 48;
        notification-body-image-height = 100;
        notification-body-image-width = 200;
        timeout = 4;
        timeout-low = 2;
        timeout-critical = 9;
        fit-to-screen = true;
        keyboard-shortcuts = true;
        image-visibility = "when-available";
        transition-time = 200;
        hide-on-clear = false;
        hide-on-action = false;
        script-fail-notify = true;

        # scripts = {
        #   example-script = {
        #     exec = "echo 'Do something...'";
        #     urgency = "Normal";
        #   };
        # };

        notification-visibility = {
          example-name = {
            state = "visible";
            urgency = "Low";
            app-name = "Spotify";
          };
        };

        widgets = [
          "buttons-grid"
          "notifications"
          "mpris"
          "backlight"
          "volume"
        ];

        widget-config = {
          buttons-grid = {
            actions = [
              {
                label = "󰤨 WiFi";
                position = "left";
                type = "toggle";
                command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && nmcli radio wifi on || nmcli radio wifi off'";
                update-command = "sh -c '[[ $(nmcli radio wifi) == \"enabled\" ]] && echo true || echo false'";
              }
              {
                label = "󰂯 Bluetooth";
                position = "right";
                type = "toggle";
                command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && bluetoothctl power on || bluetoothctl power off'";
                update-command = "sh -c 'bluetoothctl show | grep -q \"Powered: yes\" && echo true || echo false'";
              }
              {
                label = " CloudFlare";
                position = "left";
                type = "toggle";
                command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && warp-cli connect || warp-cli disconnect'";
                update-command = "sh -c '[[ $(warp-cli status ) == \"Status update: Connected\" ]] && echo true || echo false'";
              }
              {
                label = " Night";
                position = "right";
                type = "toggle";
                command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && systemctl --user start wlsunset.service || systemctl --user stop wlsunset.service'";
                update-command = "sh -c 'systemctl --user is-active --quiet wlsunset.service && echo true || echo false'";
              }
              {
                label = " DnD";
                position = "left";
                type = "toggle";
                active = false;
                command = "sh -c '[[ $SWAYNC_TOGGLE_STATE == true ]] && swaync-client --dnd-on || swaync-client --dnd-off'";
                update-command = "sh -c '[[ $(swaync-client --get-dnd) == \"true\" ]] && echo true || echo false'";
              }
              {
                label = "󱨍 Picker";
                position = "right";
                command = "sh -c 'swaync-client --close-panel; hyprpicker -a'";
              }
              {
                label = "󱣵 Snip";
                position = "left";
                command = "sh -c 'swaync-client --close-panel && hyprshot -m region'";
              }
              {
                label = "󰻿 Record";
                position = "right";
                command = "sh -c 'obs'";
              }
              {
                label = " Profiles";
                position = "left";
                command = "obs";
              }
              {
                label = "󰃢 Clear";
                position = "right";
                command = "sh -c 'swaync-client --close-all'";
              }
            ];
          };

          mpris = {
            image-size = 96;
            image-radius = 12;
          };

          backlight = {
            label = "󰽤 ";
            device = "intel_backlight";
          };

          volume = {
            label = "󰓃 ";
            show-per-app = false;
          };
        };
      };
      style = ''
        @import "control-center.css";
        @import "notifications.css";
      '';
    };
  };
}
