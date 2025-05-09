{
  pkgs,
  bifrost,
  lib,
  config,
  ...
}: let
  colors = import ../../../.local/state/matugen/colors.nix;
  colorScheme = {
    name = "Meow";
    slug = "meow";
    palette = ''
            [ColorScheme]
      active_colors=${colors.on_background}, ${colors.surface}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, ${colors.on_background}, #ffffff, ${colors.on_surface}, ${colors.background}, ${colors.background}, ${colors.shadow}, ${colors.primary_container}, ${colors.on_primary_container}, ${colors.secondary}, ${colors.primary}, ${colors.surface}, ${colors.scrim}, ${colors.surface}, ${colors.on_surface}, ${colors.secondary}
      disabled_colors=${colors.on_background}, ${colors.surface}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, ${colors.on_background}, #ffffff, ${colors.on_surface}, ${colors.background}, ${colors.background}, ${colors.shadow}, ${colors.primary_container}, ${colors.on_primary_container}, ${colors.secondary}, ${colors.primary}, ${colors.surface}, ${colors.scrim}, ${colors.surface}, ${colors.on_surface}, ${colors.secondary}
      inactive_colors=${colors.on_background}, ${colors.surface}, #ffffff, #cacaca, #9f9f9f, #b8b8b8, ${colors.on_background}, #ffffff, ${colors.on_surface}, ${colors.background}, ${colors.background}, ${colors.shadow}, ${colors.primary_container}, ${colors.on_primary_container}, ${colors.secondary}, ${colors.primary}, ${colors.surface}, ${colors.scrim}, ${colors.surface}, ${colors.on_surface}, ${colors.secondary}

    '';
  };

  baseConfig = {
    Appearance = {
      color_scheme_path = "${config.home.homeDirectory}/.config/qt5ct/colors/${colorScheme.slug}.conf";
      custom_palette = true;
      icon_theme = config.gtk.iconTheme.name;
      style = "Adwaita-Dark";
    };

    Troubleshooting = {
      force_raster_widgets = 1;
      ignored_applications = "@Invalid()";
    };

    Interface = {
      cursor_flash_time = 1200;
      double_click_interval = 400;
      menus_have_icons = true;
      show_shortcuts_in_context_menus = true;
      buttonbox_layout = 3; # GNOME dialog button layout
      toolbutton_style = 4; # Follow the application style
      activate_item_on_single_click = 1;
      dialog_buttons_have_icons = 1;
      underline_shortcut = 1;
      wheel_scroll_lines = 3;
      keyboard_scheme = 2; # X11
    };
  };
in {
  qt = {
    platformTheme.name = "qtct";
    style.package = with pkgs; [adwaita-qt adwaita-qt6];
  };

  home.packages = with pkgs; [
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
  ];

  home.file.".config/qt5ct/colors/${colorScheme.slug}.conf".text = colorScheme.palette;
  home.file.".config/qt6ct/colors/${colorScheme.slug}.conf".text = colorScheme.palette;
  home.file.".config/qt5ct/qt5ct.conf".text = lib.generators.toINI {} (baseConfig
    // {
      Fonts = with bifrost.themes.font; {
        fixed = "\"${monospace.name},${toString size},-1,5,50,0,0,0,0,0,${monospace.variant}\"";
        general = "\"${sansSerif.name},${toString size},-1,5,50,0,0,0,0,0,${sansSerif.variant}\"";
      };
    });
  home.file.".config/qt6ct/qt6ct.conf".text = lib.generators.toINI {} (baseConfig
    // {
      Fonts = with bifrost.themes.font; {
        fixed = "\"${monospace.name},${toString size},-1,5,400,0,0,0,0,0,0,0,0,0,0,1,${monospace.variant}\"";
        general = "\"${sansSerif.name},${toString size},-1,5,400,0,0,0,0,0,0,0,0,0,0,1,${sansSerif.variant}\"";
      };
    });

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "adwaita";
  };
}
