{
  lib,
  pkgs,
  username,
  colors,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;

  style = ''
    window#osd {
      padding: 0px 0px;
      border-radius: 5px;
      border: none;
      background: ${colors.background.hex};

      #container {
        margin: 10px;
      }

      image,
      label {
        color: ${colors.on_background.hex};
      }

      progressbar:disabled,
      image:disabled {
        opacity: 0.5;
      }

      progressbar {
        min-height: 13px;
        border-radius: 5px;
        background: transparent;
        border: none;
      }
      trough {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: ${colors.tertiary_container.hex};
      }
      progress {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: ${colors.primary.hex};
      }
    }
  '';
in {
  config = mkIf (!isServer && isWayland) {
    services.swayosd = {
      enable = true;
      topMargin = 0.9;
      stylePath = "/home/${username}/.config/swayosd/style.css";
    };

    home.packages = with pkgs; [
      brightnessctl
    ];

    xdg.configFile."swayosd/style.css".text = style;
  };
}
