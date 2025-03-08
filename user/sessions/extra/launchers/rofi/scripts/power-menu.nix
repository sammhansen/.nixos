{
  pkgs,
  config,
  ...
}: let
  themDir = "${config.home.homeDirectory}/.config/rofi/themes";

  # Icons
  shutdown = "";
  reboot = "";
  lock = "";
  logout = "";
  yes = "";
  no = "";

  rofi-powermenu = pkgs.writeShellApplication {
    name = "rofi-powermenu";
    text = ''
      # Rofi CMD
      rofi_cmd() {
          rofi -dmenu \
              -mesg " Uptime: ''$(uptime | awk '{print $3}' | cut -d ',' -f 1)" \
              -theme ${themDir}/powermenu.rasi
      }

      # Confirmation CMD
      confirm_cmd() {
          rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
              -theme-str 'mainbox {children: [ "message", "listview" ];}' \
              -theme-str 'listview {columns: 2; lines: 1;}' \
              -theme-str 'element-text {horizontal-align: 0.5;}' \
              -theme-str 'textbox {horizontal-align: 0.5;}' \
              -dmenu \
              -p 'Confirmation' \
              -mesg 'Are you Sure?' \
              -theme ${themDir}/powermenu.rasi
      }

      # Ask for confirmation
      confirm_exit() {
          echo -e "${yes}\n${no}" | confirm_cmd
      }

      # Pass variables to rofi dmenu
      run_rofi() {
          echo -e "${lock}\n${logout}\n${reboot}\n${shutdown}" | rofi_cmd
      }

      # Execute Command
      run_cmd() {
          selected="''$(confirm_exit)"
          if [[ "''$selected" == "${yes}" ]]; then
              if [[ ''$1 == '--shutdown' ]]; then
                  systemctl poweroff
              elif [[ ''$1 == '--reboot' ]]; then
                  systemctl reboot
              elif [[ ''$1 == '--suspend' ]]; then
                  mpc -q pause
                  amixer set Master mute
                  systemctl suspend
              elif [[ ''$1 == '--logout' ]]; then
                  case "''$DESKTOP_SESSION" in
                  "hyprland")
                      service_name="wayland-wm@Hyprland.service"
                      if systemctl is-active --quiet $service_name --user; then
                        uwsm stop
                      else
                        hyprctl dispatch exit
                      fi
                      ;;
                  "qtile")
                      qtile cmd-obj -o cmd -f shutdown
                      ;;
                  "bspwm")
                      bspc quit
                      ;;
                  esac
              fi
          else
              exit 0
          fi
      }

      # Actions
      chosen="''$(run_rofi)"
      case ''${chosen} in
      "${shutdown}")
          run_cmd --shutdown
          ;;
      "${reboot}")
          run_cmd --reboot
          ;;
      "${lock}")
          if [[ "$DESKTOP_SESSION" == 'hyprland' || "$XDG_SESSION_TYPE" == 'wayland' ]]; then
              hyprlock
          else
              betterlockscreen -l
          fi
          ;;
      "${logout}")
          run_cmd --logout
          ;;
      esac
    '';
  };
in {
  nixpkgs.overlays = [
    (final: prev: {
      rofi-powermenu = rofi-powermenu;
    })
  ];
}
