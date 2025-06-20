{
  lib,
  isLaptop,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf isLaptop {
    services.libinput = {
      enable = true;

      # disable mouse acceleration
      mouse = {
        accelProfile = "flat";
        accelSpeed = "0";
        middleEmulation = false;
      };

      # touchpad settings
      touchpad = {
        naturalScrolling = true;
        tapping = true;
        clickMethod = "clickfinger";
        horizontalScrolling = false;
        disableWhileTyping = true;
      };
    };
  };
}
