{
  username,
  bifrost,
  pkgs,
  ...
}: let
  colors = import ../../../../.local/state/matugen/colors.nix;
  dotsdir = bifrost.userconf.dotsdir;
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {
      enable = true;
      target = "graphical-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "left";
        width = 15;
        margin-top = 5;
        margin-bottom = 5;
        margin-left = 4;
        margin-right = 0;
        gtk-layer-shell = true;
        exclusive = true;
        passthrough = false;
        spacing = 3;
        fixed-center = true;
        ipc = true;

        "custom/menu" = {
          format = "";
          on-click = "fuzzel";
          tooltip = false;
        };

        cpu = {
          format = "<span foreground='${colors.primary}'></span>\n{usage}";
          interval = 1;
          min-length = 5;
          format-alt-click = "click";
        };

        memory = {
          interval = 10;
          format = "<span foreground='${colors.primary}'></span>\n{percentage}";
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
        };

        disk = {
          interval = 30;
          path = "/";
          format = "<span foreground='${colors.primary}'></span>\n{percentage_used}";
          tooltip = false;
        };

        clock = {
          interval = 1;
          format = "<span foreground='${colors.primary}'></span>\n{:%H\n%M}";
          tooltip = false;
        };
        "niri/workspaces" = {
          format = "{index}";
        };

        bluetooth = {
          format = "󰂯";
          format-connected = "󰂯";
          format-disabled = "";
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
            activated = "";
            deactivated = "";
          };
        };

        "custom/swaync" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = "";
            none = "";
            dnd-notification = "";
            dnd-none = "";
            inhibited-notification = "";
            inhibited-none = "";
            dnd-inhibited-notification = "";
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
          format = "<span foreground='${colors.primary}' size='13000'>󰁹</span>\n{capacity}";
          format-charging = "<span foreground='${colors.primary}' size='13000'>󰁹<span foreground='${colors.primary}'><sup></sup></span></span>\n{capacity}";
          format-plugged = "<span foreground='${colors.tertiary_container}' size='13000'>󰁹</span>\n{capacity}";
          format-full = "100";
          tooltip = false;
        };
        "custom/batt-warn" = {
          exec = "/home/${username}/.config/waybar/scripts/batt-warn.sh";
          interval = 5;
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
          "niri/workspaces"
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
      @define-color background ${colors.background};
      @define-color on_background ${colors.on_background};
      @define-color primary ${colors.primary};
      @define-color primary_fixed ${colors.primary_fixed};
      @define-color primary_container ${colors.primary_container};
      @define-color on_primary_container ${colors.on_primary_container};
      @define-color secondary_container ${colors.on_secondary_container};
      @define-color on_secondary_container ${colors.on_secondary_container};
      @define-color tertiary ${colors.tertiary};
      @define-color outline_variant ${colors.outline_variant};
      @define-color error ${colors.error};
      @define-color error_container ${colors.error_container};
      @define-color on_error_container ${colors.on_error_container};

      * {
        font-family: "SpaceMono Nerd Font";
        font-size: 97%;
      }

      window#waybar {
        background: @background;
        border-radius: 0px;
        border: 1px solid @outline_variant;
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
      #battery {
        color: @on_background;
        padding-top: 5px;
        padding-bottom: 5px;
      }

      #clock {
        color: @on_background;
      }

      #workspaces button {
        color: @primary;
        font-size: 13px;
      }

      #workspaces button.empty {
        color: @outline_variant;
      }

      #workspaces button.active {
        color: @on_primary_container;
        background-color: @primary_container;
        border-radius: 20px;
        padding: 0px;
        margin: 2px 7px 2px 7px;
      }

      #workspaces button.special {
        color: @on_secondary_container;
        background-color: @secondary_container;
        border-radius: 20px;
        padding: 0px;
        margin: 2px 7px 2px 7px;

      }

      #workspaces button.visible {
        color: @on_primary_container;
        background-color: @primary_container;
        border-radius: 20px;
        padding: 0px;
        margin: 2px 7px 2px 7px;
      }

      #workspaces button.urgent {
        color: @on_error_container;
        background-color: @error_container;
        border-radius: 20px;
        padding: 0px;
        margin: 2px 7px 2px 7px;
      }

      #temperature.critical {
        background-color: @error_container;
      }

      #custom-swaync,
      #bluetooth,
      #idle_inhibitor
      {
        color: @outline_variant;
        padding-top: 1px;
        padding-bottom: 1px;
      }

      #custom-swaync,
      #custom-swaync.dnd-none,
      #custom-swaync.dnd-inhibited-none
      {
        font-size: 13px;
        color: @outline_variant;
      }

      #custom-swaync.notification {
        color: @primary_fixed;
      }

      #custom-swaync.inhibited-notification,
      #custom-swaync.dnd-notification,
      #custom-swaync.dnd-inhibited-notification {
        color: @tertiary;
      }

      #bluetooth {
        font-size: 14px;
        color: @outline_variant;
      }

      #bluetooth.connected {
        color: @primary_fixed;
      }

      #idle_inhibitor {
        font-size: 15px;
        color: @outline_variant;
        margin-bottom: 3px;
      }

      #idle_inhibitor.activated {
        color: @primary_fixed;
      }

      @keyframes blink {
        to {
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        color: @error_container;
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
          swaylock
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
