{bifrost, ...}: {
  services.xserver = {
    enable = true;
    #videoDrivers = ["intel"];
    xkb = {
      layout = "${bifrost.sysconf.keyboardlayout}";
      variant = "";
    };
  };
}
