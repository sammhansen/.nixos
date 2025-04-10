{pkgs, ...}: let
  config = ../../../../.config/swaync;
in {
  home.packages = with pkgs; [
    swaynotificationcenter
  ];
  xdg.configFile = {
    "swaync" = {
      recursive = true;
      source = "${config}";
    };
  };
}
