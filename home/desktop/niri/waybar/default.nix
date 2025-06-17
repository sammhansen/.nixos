{
  username,
  bifrost,
  pkgs,
  ...
}: let
  colors = import ../../../../.local/state/matugen/colors.nix;
  dotsdir = bifrost.userconf.dotsdir;
  pink = "#f5c2e7";
  red = "#f38ba8";
  mauve = "#cba6f7";
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
          format = "<span foreground='${pink}'></span>\n{usage}";
          interval = 1;
          min-length = 5;
          format-alt-click = "click";
        };

        memory = {
          interval = 10;
          format = "<span foreground='${pink}'></span>\n{percentage}";
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
          format-critical = "<span foreground='${red}'></span>\n{temperatureC}";
          format = "<span foreground='${pink}'></span>\n{temperatureC}";
        };

        disk = {
          interval = 30;
          path = "/";
          format = "<span foreground='${pink}'></span>\n{percentage_used}";
          tooltip = false;
        };

        clock = {
          interval = 1;
          format = "<span foreground='${pink}'></span>\n{:%H\n%M}";
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
          format = "<span foreground='${pink}' size='13000'>󰁹</span>\n{capacity}";
          format-charging = "<span foreground='${pink}' size='13000'>󰁹<span foreground='${pink}'><sup></sup></span></span>\n{capacity}";
          format-plugged = "<span foreground='${mauve}' size='13000'>󰁹</span>\n{capacity}";
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
      @define-color on_background @base;
      @define-color primary ${pink};
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

      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      * {
        font-family: "SpaceMono Nerd Font";
        font-size: 97%;
      }

      window#waybar {
        background: @base;
        border-radius: 0px;
        border: 1px solid @surface0;
      }

      tooltip {
        color: @text;
        background: @base;
        border-radius: 10px;
      }

      tooltip label {
        color: @text;
        padding-right: 2px;
        padding-left: 2px;
      }

      #custom-menu {
        color: @pink;
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
        color: @text;
        padding-top: 5px;
        padding-bottom: 5px;
      }

      #clock {
        color: @text;
      }

      #workspaces button {
        color: @pink;
        font-size: 13px;
        padding: 0px;
        margin: 2px 7px 2px 7px;
        border-radius: 20px;
      }

      #workspaces button:not(.active):hover {
        color: @text;
        background-color: @overlay1;
      }

      #workspaces button.empty {
        color: @subtext0;
      }

      #workspaces button.active {
        color: @text;
        background-color: @mauve;
      }

      #workspaces button.visible {
        color: @text;
        background-color: @blue;
      }

      #workspaces button.urgent {
        color: @text;
        background-color: @red;
      }

      #temperature.critical {
        background-color: @red;
      }

      #custom-swaync,
      #bluetooth,
      #idle_inhibitor
      {
        color: @surface2;
      }

      #custom-swaync,
      #custom-swaync.dnd-none,
      #custom-swaync.dnd-inhibited-none
      {
        font-size: 11px;
        color: @surface2;
      }

      #custom-swaync.notification {
        color: @surface2;
      }

      #custom-swaync.inhibited-notification,
      #custom-swaync.dnd-notification,
      #custom-swaync.dnd-inhibited-notification {
        color: @surface2;
      }

      #bluetooth {
        font-size: 14px;
        color: @surface2;
        padding: 1px 0px 0px 0px;
      }

      #bluetooth.connected {
        color: @text;
      }

      #idle_inhibitor {
        font-size: 15px;
        color: @surface2;
        margin-bottom: 3px;
      }

      #idle_inhibitor.activated {
        color: @text;
      }

      @keyframes blink {
        to {
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        color: @red;
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
