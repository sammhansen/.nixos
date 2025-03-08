{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 5;
      gaps_workspaces = 50;
      border_size = 0;
      layout = "dwindle";
      resize_on_border = true;
      "col.active_border" = lib.mkForce "rgba(4f4256CC)";
      "col.inactive_border" = lib.mkForce "rgba(4f4256CC)";
    };
  };
}
