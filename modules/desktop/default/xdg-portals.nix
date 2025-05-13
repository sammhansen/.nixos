{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
    ];
  };

  security.rtkit = {
    enable = true;
  };
}
