{
  wayland.windowManager.hyprland.settings = {
    env = [
      "DESKTOP_SESSION,hyprland"
      "OZONE_PLATFORM,wayland"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"

      # "QT_QPA_PLATFORM, wayland"
      # "QT_QPA_PLATFORM=xcb genymotion"
      # "QT_QPA_PLATFORMTHEME, fcitx"
      #"QT_STYLE_OVERRIDE,kvantum"
      "WLR_NO_HARDWARE_CURSORS, 1"

      # Mozilla
      "MOZ_DISABLE_RDD_SANDBOX,1"
      "MOZ_ENABLE_WAYLAND,1"

      # MOUSE CURSOR
      "XCURSOR_THEME,Bibata-Modern-Ice"
      "XCURSOR_SIZE,24"
    ];
  };
}
