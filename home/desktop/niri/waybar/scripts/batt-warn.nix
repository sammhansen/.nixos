{
  isServer,
  isNiri,
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  flakeDir = config.bifrost.device.flakeDir;

  script = ''
    FLAKE_DIR="${flakeDir}"
    ICONS_PATH="$FLAKE_DIR/.local/share/assets/icons"

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
in {
  config = mkIf (!isServer && isNiri) {
    xdg.configFile."waybar/scripts/batt-warn.sh" = {
      text = script;
      executable = true;
    };
  };
}
