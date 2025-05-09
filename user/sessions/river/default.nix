{pkgs, ...}: {
  wayland.windowManager.river = {
    enable = true;
    package = pkgs.river;
    xwayland.enable = true;
    extraSessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };
    extraConfig = ''
    '';
    settings = {
      set = {
        mod = "Mod4";
      };
      map = {
        normal = {
          "Mod4 Q" = "close";
          "Mod4 Tab" = "spawn foot";
          "Mod4 Return" = "spawn foot";
          "Mod4 a" = "spawn 'rofi -show drun -theme ~/.config/rofi/launcher.rasi'";
          "Mod4 b" = "spawn chromium";
          "Control Shift S" = "spawn wlogout";
        };
      };
      spawn = [
        "waybar"
        "swaync"
      ];
    };
  };
}
