{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.niri;
in {
  config = mkIf cfg.enable {
    services.kanshi = {
      enable = true;
      systemdTarget = "graphical-session.target";
      settings = [
        {
          output.criteria = "eDP-1";
          output.mode = "1920x1080@60";
          output.scale = 1.0;
        }
        {
          output.criteria = "HDMI-A-2";
          output.mode = "1920x1080@60";
          output.scale = 1.0;
        }
        {
          profile = {
            name = "undocked";
            outputs = [
              {
                criteria = "eDP-1";
                status = "enable";
                position = "0,0";
              }
            ];
            exec = "notify-send 'System' 'Display DELL24 not connected'";
          };
        }
        {
          profile = {
            name = "docked";
            outputs = [
              {
                criteria = "eDP-1";
                status = "enable";
                position = "0,1080";
              }
              {
                criteria = "HDMI-A-2";
                status = "enable";
                position = "0,0";
              }
            ];
            exec = "notify-send 'System' 'Display DELL24 Connected'";
          };
        }
      ];
    };
  };
}
