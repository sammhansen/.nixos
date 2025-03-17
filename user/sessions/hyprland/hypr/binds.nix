{
  bifrost,
  lib,
  username,
  pkgs,
  ...
}: let
  browser = bifrost.browsers.browser;

  screenshot_path = "/home/${username}/Pictures/Screenshots";
  hyprshot = pkgs.writeShellScriptBin "hyprshot.sh" ''
    if [[ ! -d ${screenshot_path} ]];then
      mkdir -p ${screenshot_path}
    fi

    ${pkgs.hyprshot}/bin/hyprshot -m region -o ${screenshot_path}
  '';

  clipboard = pkgs.writeShellScriptBin "rofi-clipboard.sh" ''
    config="
    configuration{dmenu{display-name:\" \";}}
    window{width:440px; height:271px;}
    listview{scrollbar:false;}
    "
    themeDir="~/.config/rofi/themes/default.rasi"

    cliphist list |
        rofi -dmenu -theme-str "''${config}" -theme "''${themeDir}" |
        cliphist decode |
        wl-copy
  '';
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Recording stuff
      "Super+Alt, R, exec, ~/.config/ags/scripts/record-script.sh" # Record region (no sound)
      "Ctrl+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen" # [hidden] Record screen (no sound)
      "Super+Shift+Alt, R, exec, ~/.config/ags/scripts/record-script.sh --fullscreen-sound" # Record screen (with sound)
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    binde = [
      "SUPER+ALT, Space, togglefloating,"
      # "SUPER, F, fullscreen,"
      "SUPER, Q, killactive,"
      "SUPER SHIFT, Q, exit,"
      "SUPER, C, exec, hyprctl dispatch centerwindow"
      "SUPER, T, exec, hyprctl dispatch togglesplit"
      "SUPER, P, pin, active"
      "ALT, L, exec, hyprlock"

      # Focus Window
      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      # Move Window
      "SUPER SHIFT, H, movewindow, l"
      "SUPER SHIFT, L, movewindow, r"
      "SUPER SHIFT, K, movewindow, u"
      "SUPER SHIFT, J, movewindow, d"

      # Special Window/Scrachpad
      # "SUPER, S, togglespecialworkspace"
      # "SUPER SHIFT, S, movetoworkspace, special"

      # Group
      "SUPER, G, togglegroup,"
      "SUPER SHIFT, G, lockgroups, toggle"
      "ALT SHIFT, H, changegroupactive, b"
      "ALT SHIFT, L, changegroupactive, f"

      # Workspaces
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"
      "SUPER, 5, workspace, 5"

      # Move active window to a workspace with mainMod + SHIFT + [0-5]
      "SUPER SHIFT, 1, movetoworkspace, 1"
      "SUPER SHIFT, 2, movetoworkspace, 2"
      "SUPER SHIFT, 3, movetoworkspace, 3"
      "SUPER SHIFT, 4, movetoworkspace, 4"
      "SUPER SHIFT, 5, movetoworkspace, 5"

      # Scroll through existing workspaces with mainMod + scroll
      "SUPER, mouse_down, workspace, e+1"
      "SUPER, mouse_up, workspace, e-1"

      # Audio Control
      "SUPER SHIFT, P, exec, playerctl play-pause"

      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"

      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"

      ",XF86Search, exec, blueberry"

      # Apps
      "SUPER, TAB, exec, uwsm app -- kitty"
      "SUPER, T, exec, uwsm app -- foot"
      "SUPER , E, exec, uwsm app -- nautilus --new-window"
      "SUPER, D, exec, ~/.config/hypr/dmenu.sh"
      "SUPER, PERIOD, exec, uwsm app -- ${pkgs.smile}/bin/smile"
      "ALT, S, exec, ${hyprshot}/bin/hyprshot.sh"

      "ALT, F, exec, hints"

      # Rofi
      "SUPER, A , exec,  uwsm app -- rofi -show drun -theme ~/.config/rofi/launcher.rasi"
      "SUPER, V, exec, ${clipboard}/bin/rofi-clipboard.sh"
      "SUPER, W , exec, ${pkgs.rofi-power-menu}/bin/rofi-powermenu"

      "Super, B, exec, ${browser}"
      "Alt, C, exec, chromium --app='https://chatgpt.com'"
      "Alt, G, exec, chromium --app='https://gemini.google.com/app'"

      "Alt, D, exec, hints"
      "Alt, F, exec, hints --mode scroll"

      "Super, F, fullscreen, 0"
      "Super, D, fullscreen, 1"
      #"Super_Alt, F, fakefullscreen, 0"
      "Super, 1, workspace, 1"
      "Super, 2, workspace, 2"
      "Super, 3, workspace, 3"
      "Super, 4, workspace, 4"
      "Super, 5, workspace, 5"
      "Super, 6, workspace, 6"
      "Super, 7, workspace, 7"
      "Super, 8, workspace, 8"
      "Super, 9, workspace, 9"
      "Super, 0, workspace, 10"
      "Super, S, togglespecialworkspace,"
      # "Control+Super, S, togglespecialworkspace,"
      "Alt, Tab, cyclenext"
      "Alt, Tab, bringactivetotop,"
      "Super+Alt, 1, movetoworkspacesilent, 1"
      "Super+Alt, 2, movetoworkspacesilent, 2"
      "Super+Alt, 3, movetoworkspacesilent, 3"
      "Super+Alt, 4, movetoworkspacesilent, 4"
      "Super+Alt, 5, movetoworkspacesilent, 5"
      "Super+Alt, 6, movetoworkspacesilent, 6"
      "Super+Alt, 7, movetoworkspacesilent, 7"
      "Super+Alt, 8, movetoworkspacesilent, 8"
      "Super+Alt, 9, movetoworkspacesilent, 9"
      "Super+Alt, 0, movetoworkspacesilent, 10"
      "Control+Shift+Super, Up, movetoworkspacesilent, special"
      "Super+Alt, S, movetoworkspacesilent, special"
    ];
  };
}
