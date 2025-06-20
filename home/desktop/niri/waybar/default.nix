{
  lib,
  pkgs,
  username,
  colors,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./scripts/default.nix
  ];

  config = mkIf (!isServer && isWayland) {
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
            format = "<span foreground='${colors.primary.hex}'></span>\n{usage}";
            interval = 1;
            min-length = 5;
            format-alt-click = "click";
          };

          memory = {
            interval = 10;
            format = "<span foreground='${colors.primary.hex}'></span>\n{percentage}";
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
            format-critical = "<span foreground='${colors.error.hex}'></span>\n{temperatureC}";
            format = "<span foreground='${colors.primary.hex}'></span>\n{temperatureC}";
          };

          disk = {
            interval = 30;
            path = "/";
            format = "<span foreground='${colors.primary.hex}'></span>\n{percentage_used}";
            tooltip = false;
          };

          clock = {
            interval = 1;
            format = "<span foreground='${colors.primary.hex}'></span>\n{:%H\n%M}";
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
            format = "<span foreground='${colors.primary.hex}' size='13000'>󰁹</span>\n{capacity}";
            format-charging = "<span foreground='${colors.primary.hex}' size='13000'>󰁹<span foreground='${colors.primary.hex}'><sup></sup></span></span>\n{capacity}";
            format-plugged = "<span foreground='${colors.tertiary_container.hex}' size='13000'>󰁹</span>\n{capacity}";
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
        @define-color background ${colors.background.hex};
        @define-color on_background ${colors.on_background.hex};
        @define-color primary ${colors.primary.hex};
        @define-color primary_fixed ${colors.primary_fixed.hex};
        @define-color primary_container ${colors.primary_container.hex};
        @define-color on_primary_container ${colors.on_primary_container.hex};
        @define-color secondary_container ${colors.on_secondary_container.hex};
        @define-color on_secondary_container ${colors.on_secondary_container.hex};
        @define-color tertiary ${colors.tertiary.hex};
        @define-color outline_variant ${colors.outline_variant.hex};
        @define-color error ${colors.error.hex};
        @define-color error_container ${colors.error_container.hex};
        @define-color on_error_container ${colors.on_error_container.hex};
        @define-color surface_variant ${colors.surface_variant.hex};
        @define-color on_surface_variant ${colors.on_surface_variant.hex};

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
          padding: 0px;
          margin: 2px 7px 2px 7px;
          border-radius: 20px;
        }

        #workspaces button:not(.active):hover {
          color: @on_surface_variant;
          background-color: @surface_variant;
        }

        #workspaces button.empty {
          color: @outline_variant;
        }

        #workspaces button.active {
          color: @on_primary_container;
          background-color: @primary_container;
        }

        #workspaces button.visible {
          color: @on_primary_container;
          background-color: @primary_container;
        }

        #workspaces button.urgent {
          color: @on_error_container;
          background-color: @error_container;
        }

        #temperature.critical {
          background-color: @error;
        }

        #custom-swaync,
        #bluetooth,
        #idle_inhibitor
        {
          color: @outline_variant;
        }

        #custom-swaync,
        #custom-swaync.dnd-none,
        #custom-swaync.dnd-inhibited-none
        {
          font-size: 11px;
          color: @outline_variant;
        }

        #custom-swaync.notification {
          color: @on_background;
        }

        #custom-swaync.inhibited-notification,
        #custom-swaync.dnd-notification,
        #custom-swaync.dnd-inhibited-notification {
          color: @on_background;
        }

        #bluetooth {
          font-size: 14px;
          color: @surface2;
          padding: 1px 0px 0px 0px;
        }

        #bluetooth.connected {
          color: @on_background;
        }

        #idle_inhibitor {
          font-size: 15px;
          color: @outline_variant;
          margin-bottom: 3px;
        }

        #idle_inhibitor.activated {
          color: @on_background;
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
  };
}
