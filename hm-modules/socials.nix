{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    zoom-us
    vesktop
  ];
}
