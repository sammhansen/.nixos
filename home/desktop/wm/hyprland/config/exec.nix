{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- ags run &"
      "uwsm app -- nm-applet &"
      "uwsm app -- wl-paste --type text --watch cliphist store &"
      "uwsm app -- wl-paste --type image --watch cliphist store &"
      "uwsm app -- discord &"
      "uwsm app -- wlsunset &"
      "uwsm app -- swww-daemon --format xrgb"
      "hyprctl setcursor Bibata-Modern-Classic 24"
    ];
  };
}
