{pkgs, ...}: {
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
}
