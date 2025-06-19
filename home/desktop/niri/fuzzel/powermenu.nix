{
  isServer,
  isNiri,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  script = ''
    #!/usr/bin/env bash

    pkill fuzzel

    options="Lock\nSuspend\nHibernate\nReboot\nShutdown\nLogout"

    choice=$(echo -e "$options" | fuzzel --dmenu -p "> ")

    case "$choice" in
    Lock)
      hyprlock
      ;;
    Suspend)
      systemctl suspend
      ;;
    Hibernate)
      systemctl hibernate
      ;;
    Reboot)
      systemctl reboot
      ;;
    Shutdown)
      systemctl poweroff
      ;;
    Logout)
      niri msg action quit
      ;;
    esac
  '';
in {
  config = mkIf (!isServer && isNiri) {
    xdg.configFile."fuzzel/scripts/powermenu.sh" = {
      text = script;
      executable = true;
    };
  };
}
