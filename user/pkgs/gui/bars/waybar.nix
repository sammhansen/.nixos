{
  username,
  bifrost,
  ...
}: let
  colors = import ../../../../.local/state/matugen/colors.nix;
  dotsdir = bifrost.userconf.dotsdir;
in {
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "left";
        width = 15;
        margin-top = 4;
        margin-bottom = 4;
        margin-left = 2;
        margin-right = 0;
        gtk-layer-shell = true;
        exclusive = true;
        passthrough = false;
        spacing = 3;
        fixed-center = true;
        ipc = true;

        "custom/menu" = {
          format = "";
          on-click = "rofi -show drun -theme ~/.config/rofi/launcher.rasi";
          tooltip = false;
        };

        cpu = {
          # format = "󰍛 \n{usage}";
          format = "<span foreground='${colors.primary}'></span>\n{usage}";
          interval = 1;
          min-length = 5;
          format-alt-click = "click";
        };

        memory = {
          interval = 10;
          format = "<span foreground='${colors.primary}'></span>\n{percentage}";
          # format = "󰾆\n{percentage}";
          tooltip = false;
        };

        temperature = {
          interval = 10;
          tooltip = true;
          hwmon-path = [
            "/sys/class/hwmon/hwmon1/temp1_input"
            "/sys/class/thermal/thermal_zone0/temp"
          ];
          critical-threshold = 82;
          format-critical = "<span foreground='${colors.error}'></span>\n{temperatureC}";
          format = "<span foreground='${colors.primary}'></span>\n{temperatureC}";
          # format-icons = ["󰈸"];
          # format-icons = [""];
        };

        disk = {
          interval = 30;
          path = "/";
          # format = "󰋊\n{percentage_used}";
          format = "<span foreground='${colors.primary}'></span>\n{percentage_used}";
          tooltip = false;
        };

        clock = {
          interval = 1;
          format = "<span foreground='${colors.primary}'></span>\n{:%H\n%M}";
          # format-icons = ["󰅓"];
          tooltip = false;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          orientation = "vertical";
          persistent-workspaces = {
            "HDMI-A-2" = [1 2 3 4 5];
            "eDP-1" = [6 7 8 9];
          };
        };
        "river/tags" = {
          num-tags = 9;
          tag-labels = [
            1
            2
            3
            4
            5
            6
            7
            8
            9
          ];
          disable-click = false;
          hide-vacant = false;
        };

        bluetooth = {
          format = "";
          format-disabled = "󰂯";
          # format-connected = "󰂳\n{num_connections}";
          format-connected = "󰂯<span foreground='${colors.error}'><sup></sup></span>";
          tooltip-format = "󰂯 {device_alias}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = "󰂯 {device_alias} 󰁹{device_battery_percentage}";
          tooltip = true;
          on-click = "blueberry";
        };

        tray.spacing = 5;

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰛊<span foreground='${colors.error}'><sup></sup></span>";
            deactivated = "󰛊";
          };
        };

        "custom/swaync" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='${colors.error}'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='${colors.error}'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='${colors.error}'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='${colors.error}'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        battery = {
          full-at = 100;
          design-capacity = false;
          states = {
            good = 95;
            warning = 30;
            critical = 10;
          };
          format = "<span foreground='${colors.primary}' size='13000'></span>\n{capacity}";
          format-charging = "<span foreground='${colors.primary}' size='13000'><span foreground='#2CFF05'><sup></sup></span></span>\n{capacity}";
          format-plugged = "<span foreground='${colors.tertiary_container}' size='13000'></span>\n{capacity}";
          format-full = "100";
          # format-icons = [
          #   # "❤"
          #   "💙" #blue
          #   "💚" #green
          #   "💛" #yellow
          #
          #   # "󰂎"
          #   # "󰁺"
          #   # "󰁻"
          #   # "󰁼"
          #   # "󰁽"
          #   # "󰁾"
          #   # "󰁿"
          #   # "󰂀"
          #   # "󰂁"
          #   # "󰂂"
          #   # "󰁹"
          # ];
          tooltip = false;
        };
        "custom/batt-warn" = {
          exec = "/home/${username}/.config/waybar/scripts/batt-warn.sh";
          interval = 7;
        };

        modules-left = [
          "custom/menu"
          "cpu"
          "memory"
          "temperature"
          "disk"
          "clock"
        ];
        modules-center = [
          "hyprland/workspaces"
          "river/tags"
        ];
        modules-right = [
          "custom/swaync"
          "bluetooth"
          "idle_inhibitor"
          "tray"
          "battery"
          "custom/batt-warn"
        ];
      }
    ];

    style = ''
      @define-color primary ${colors.primary};
      @define-color background ${colors.background};
      @define-color on_background ${colors.on_background};

      * {
        font-family: "SpaceMono Nerd Font";
        font-size: 97%;
      }

      window#waybar {
        background: @background;
        border-radius: 3px;
      }

      tooltip {
        color: @on_background;
        background: @background;
        border-radius: 10px;
      }

      tooltip label {
        color: @on_background;
        padding-right: 2px;
        padding-left: 2px;
      }

      #custom-menu {
        color: @primary;
        font-size: 23px;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-right: 0px;
        padding-left: 0px;
      }

      #cpu,
      #memory,
      #temperature,
      #disk,
      #clock,
      #bluetooth,
      #battery {
        color: @on_background;
        padding-top: 5px;
        padding-bottom: 5px;
      }

      #custom-swaync {
        color: @on_background;
      }

      #clock {
        color: @on_background;
      }

      #workspaces button {
        color: @on_background;
        font-size: 13px;
      }

      #workspaces button.active {
        color: @on_background;
      }

      #workspaces button.focused {
        color: @primary;
      }

      #workspaces button.urgent {
        color: @on_background;
      }

      #temperature.critical {
        background-color: ${colors.error_container};
      }

      #idle_inhibitor {
        font-size: 15px;
      }

      #bluetooth {
        font-size: 15px;
      }

      @keyframes blink {
        to {
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        color: ${colors.error_container};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };

  home.file.".config/waybar/scripts/batt-warn.sh".text = ''
    USERNAME="${username}"
    DOTS_PATH="${dotsdir}"
    ICONS_PATH="/home/$USERNAME/$DOTS_PATH/.local/share/assets/icons"

    LOW=15
    CRITICAL=5

    WARN_CRITICAL_FILE="/tmp/.batt-warn-critical"
    WARN_LOW_FILE="/tmp/.batt-warn-low"
    WARN_FULL_FILE="/tmp/.batt-warn-full"

    BATT_STATUS=$(cat /sys/class/power_supply/BAT1/status)
    BATT_LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)

    if [ "$BATT_STATUS" = "Discharging" ]; then
      if [ "$BATT_LEVEL" -le "$CRITICAL" ]; then
        if [ ! -f "$WARN_CRITICAL_FILE" ]; then
          notify-send "Battery critical" "Suspending in 5 seconds" -i "$ICONS_PATH"/batt-critical.png -u normal
          sleep 5
          systemctl suspend
          sleep 3
          hyprlock
          touch "$WARN_CRITICAL_FILE"
        fi
      elif [ "$BATT_LEVEL" -le "$LOW" ]; then
        if [ ! -f "$WARN_LOW_FILE" ]; then
          notify-send "Battery low" "Please plug me in kudasai" -i "$ICONS_PATH"/batt-low.png -u normal
          touch "$WARN_LOW_FILE"
        fi
      else
        :
      fi

      rm -f "$WARN_FULL_FILE"

    elif [ "$BATT_STATUS" = "Charging" ]; then
      rm -f "$WARN_CRITICAL_FILE"
      rm -f "$WARN_LOW_FILE"
      rm -f "$WARN_FULL_FILE"

    elif [ "$BATT_STATUS" = "Full" ]; then
      if [ ! -f "$WARN_FULL_FILE" ]; then
        notify-send "Battery full" "Please unplug me" -i "$ICONS_PATH"/batt-full.png -u normal
        touch "$WARN_FULL_FILE"
      fi
    else
      :
    fi
  '';
  home.file.".config/waybar/scripts/batt-warn.sh".executable = true;
}
