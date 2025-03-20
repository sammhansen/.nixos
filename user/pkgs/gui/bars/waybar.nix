{pkgs, ...}: let
  waybar_config = ../../../../.config/waybar;
in {
  programs.waybar = {
    enable = true;
    # systemd.enable = true;
  };

  home.packages = with pkgs; [
    swaynotificationcenter
  ];
  xdg.configFile = {
    "waybar" = {
      recursive = true;
      source = "${waybar_config}";
    };
  };
}
