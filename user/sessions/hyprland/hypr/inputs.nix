{...}: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      numlock_by_default = true;
      repeat_delay = 250;
      repeat_rate = 35;

      accel_profile = "flat"; # required for hints

      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        clickfinger_behavior = true;
        scroll_factor = 0.5;
      };

      follow_mouse = 1;
    };

    cursor = {
      no_hardware_cursors = true;
    };

    device = {
      name = "ydotoold-virtual-device-1";
      accel_profile = "flat";
    };
  };
}
