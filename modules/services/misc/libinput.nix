{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf bifrost.hardware.islaptop {
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
