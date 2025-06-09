{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost.sessions.niri;
in {
  config = mkIf cfg.enable {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "loginctl lock-session";
          text = "lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate || loginctl hibernate";
          text = "save";
          keybind = "h";
        }
        {
          label = "logout";
          action = "pkill niri || riverctl exit || pkill Hyprland || loginctl terminate-user $USER";
          text = "logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff || loginctl poweroff";
          text = "power_settings_new";
          keybind = "s";
        }
        {
          label = "suspend";
          action = "systemctl suspend || loginctl suspend";
          text = "bedtime";
          keybind = "u";
        }
        {
          label = "reboot";
          action = "systemctl reboot || loginctl reboot";
          text = "restart_alt";
          keybind = "r";
        }
      ];
      style = ''
        * {
        	all: unset;
        	background-image: none;
        	transition: 400ms cubic-bezier(0.05, 0.7, 0.1, 1);
        }

        window {
        	background: rgba(0, 0, 0, 0.5);
        }

        button {
        	font-family: 'Material Symbols Outlined';
        	font-size: 10rem;
        	background-color: rgba(11, 11, 11, 0.4);
        	color: #FFFFFF;
        	margin: 2rem;
        	border-radius: 2rem;
        	padding: 3rem;
        }

        button:focus,
        button:active,
        button:hover {
        	background-color: rgba(51, 51, 51, 0.5);
        	border-radius: 4rem;
        }
      '';
    };
  };
}
