{...}: let
  colorsPath = "${builtins.getEnv "HOME"}/.local/state/colors.nix";
  colorsExist = builtins.pathExists colorsPath;
  fallback = import ../../../.local/state/colors.nix;
  colors =
    if colorsExist
    then import colorsPath
    else fallback;
in {
  wayland.windowManager.hyprland.settings = {
    general = {
      "col.active_border" = "${colors.primary}";
      "col.inactive_border" = "${colors.outline}";
    };

    misc = {
      background_color = "${colors.on_primary_fixed_variant}";
    };
  };
}
