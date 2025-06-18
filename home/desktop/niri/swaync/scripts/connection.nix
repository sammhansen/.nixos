{
  username,
  bifrost,
  pkgs,
  ...
}: let
  dotsdir = bifrost.userconf.dotsdir;
  script = ''
    LOCK_FILE="/tmp/connection.lock"
    ADDR="8.8.8.8"
    NOTIF_SOUND="/home/${username}/${dotsdir}/.local/share/assets/sounds/alert.mp3"
    NOTIF_IMG="/home/${username}/${dotsdir}/.local/share/assets/icons/globe.png"

    if [ -f "$LOCK_FILE" ]; then
      exit 1
    fi

    touch "$LOCK_FILE"

    while ! ${pkgs.inetutils}/bin/ping -c1 -W1 "$ADDR" >/dev/null 2>&1; do
      sleep 2
    done

    ${pkgs.mpv}/bin/mpv "$NOTIF_SOUND" >/dev/null 2>&1
    ${pkgs.libnotify}/bin/notify-send -i "$NOTIF_IMG" "System" "Your internet connection is back"
    rm -f "$LOCK_FILE"
  '';
in {
  xdg.configFile."swaync/scripts/connection.sh" = {
    text = script;
    executable = true;
  };
}
