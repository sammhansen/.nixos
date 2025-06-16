{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.niri;
  inbuilt = {
    name = bifrost.monitors.inbuilt.name;
    position = {
      x = "${bifrost.monitors.inbuilt.position.x}";
      y = "${bifrost.monitors.inbuilt.position.y}";
    };
  };
  external = bifrost.monitors.external.name;
in {
  config = mkIf cfg.enable {
    services.kanshi = {
      enable = true;
      systemdTarget = "graphical-session.target";
      settings = [
        {
          output.criteria = "${inbuilt.name}";
          output.mode = "1920x1080@60";
          output.scale = 1.0;
        }
        {
          output.criteria = "${external}";
          output.mode = "1920x1080@60";
          output.scale = 1.0;
        }
        {
          profile = {
            name = "undocked";
            outputs = [
              {
                criteria = "${inbuilt.name}";
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
                criteria = "${inbuilt.name}";
                status = "enable";
                position = "${inbuilt.position.x},${inbuilt.position.y}";
              }
              {
                criteria = "${external}";
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
