{
  username,
  pkgs,
  ...
}: let
  colors = import ./../../../../.local/state/matugen/colors.nix;
in {
  services.swayosd = {
    enable = true;
    topMargin = 0.9;
    stylePath = "/home/${username}/.config/swayosd/style.css";
  };

  home.packages = with pkgs; [
    brightnessctl
  ];

  home.file.".config/swayosd/style.css".text = ''
    window#osd {
      padding: 0px 0px;
      border-radius: 5px;
      border: none;
      background: ${colors.background};

      #container {
        margin: 10px;
      }

      image,
      label {
        color: ${colors.on_background};
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
        background: ${colors.tertiary_container};
      }
      progress {
        min-height: inherit;
        border-radius: inherit;
        border: none;
        background: ${colors.primary};
      }
    }
  '';
}
