{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {enable = false;};
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        # output = ["HDMI-A-1" "HDMI-A-2"];
        width = 30;
        # height = 250;
        margin-top = 5;
        margin-bottom = 5;
        margin-left = 5;
        margin-right = 5;
        spacing = 15;
        modules-left = ["hyprland/window"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["clock" "tray" "custom/swaync"];

        "hyprland/workspaces" = {
          format = "{name}";
          all-outputs = false;
          persistent-workspaces = {
            "HDMI-A-1" = [1 2 3 4];
            "HDMI-A-2" = [5 6 7 8 9];
          };
        };

        "hyprland/window" = {
          format = "{initialTitle}";
          max-length = 49;
          rotate = 270;
        };

        "custom/swaync" = {
          tooltip = true;
          tooltip-format = "Notification Center";
          format = "{} {icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          interval = 1;
          format = "{:%H\n%M}";
          rotate = 0;
        };
      };
    };
    style = ''

      * {
          font-family: "Iosevka Nerd Font","mplus12";
          font-size: 13px;
          min-height: 0;
      }

      window#waybar {
          background-color: rgba(27,30,40,0.88);
          border-top-right-radius:12px;
          border-bottom-right-radius:12px;
      }

      window#waybar.hidden {
          opacity: 0;
      }

      #workspaces button {
          padding:  10px 0px;
          background-color: transparent;
          color: #a6accd;
      }

      #workspaces button.persistent {
          padding:  10px 0px;
          background-color: transparent;
          color: #a6accd;
      }

      #workspaces button:hover {
          background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.active {
          color: #5de4c7;
      }

      #workspaces button.urgent {
          background-color: #1b1e28;
          color: #d0679d;
      }

      #mode {
          background-color: #cf8164;
          color: #23252e;
          /*font-weight:bold;*/
          margin: 0 4px;
      }

      #window{
          color:#a6accd;
          padding: 3px 3px;
      }
      #workspaces {
          margin: 0 0px;
      }

      .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
      }

      .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
      }

      #clock {
          color: #89ddff;
          font-size: 13px;
          margin-bottom: 2px;
      }

      @keyframes blink {
          to {
              background-color: #f5f5f5;
              color: #000000;
          }
      }

      label:focus {
          background-color: #000000;
      }

      #pulseaudio {
          color: #5de4c7;
      }

      #pulseaudio.muted {
          color: #c5c4d4;
          font-weight: normal;
      }

      #tray {
          color: #f5f5f5;
          padding-bottom:10px;
      }

      #idle_inhibitor {
          background-color: #191c25;
      }

      #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
      }

    '';
  };
}
