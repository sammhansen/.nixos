{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    configPackages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
  };

  security.rtkit = {
    enable = true;
  };
}
