{
  lib,
  bifrost,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.monitors;
  toString = builtins.toString;

  inbuilt = {
    name = cfg.inbuilt.name;
    position = {
      x = toString cfg.inbuilt.position.x;
      y = toString cfg.inbuilt.position.y;
    };
  };
  external = cfg.external.name;
in {
  config = mkIf isWayland {
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
            exec = "notify-send 'Kanshi' 'Laptop undocked'";
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
            exec = "notify-send 'Kanshi' 'Laptop docked'";
          };
        }
      ];
    };
  };
}
