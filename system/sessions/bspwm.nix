{pkgs, ...}: {
  services = {
    xserver.windowManager.bspwm = {
      enable = true;
      configFile = ./../../.config/bspwm/bspwmrc;
      sxhkd.configFile = ./../../.config/sxhkd/sxhkdrc;
    };

    picom = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    polybar
    sxhkd
  ];
}
