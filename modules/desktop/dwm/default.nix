{pkgs, ...}: {
  services.xserver.windowManager.dwm = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    st
    dmenu
  ];
}
