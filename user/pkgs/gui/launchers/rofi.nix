{pkgs, ...}: let
  config = ../../../../.config/rofi;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    plugins = with pkgs; [
      rofi-emoji
    ];
  };
  home.packages = with pkgs; [
    rofi-power-menu
  ];
  xdg.configFile = {
    "rofi" = {
      recursive = true;
      source = "${config}";
    };
  };
}
