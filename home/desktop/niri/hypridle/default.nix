{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.niri;
in {
  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          ignore_dbus_inhibit = false;
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "pidof hyprlock || hyprlock";
          after_sleep_cmd = "niri msg action power-on-monitors";
        };

        listener = [
          {
            timeout = 180;
            on-timeout = "pidof hyprlock || hyprlock";
          }
          {
            timeout = 240;
            on-timeout = "niri msg action power-off-monitors";
            on-resume = "niri msg action power-on-monitors";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
