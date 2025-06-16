{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inbuilt = {
    name = bifrost.monitors.inbuilt.name;
    position = {
      x = "${bifrost.monitors.inbuilt.position.x}";
      y = "${bifrost.monitors.inbuilt.position.y}";
    };
  };
  external = bifrost.monitors.external.name;
  browser = bifrost.browsers.default;
  wallpaper = bifrost.themes.wallpaper;

  cfg = bifrost.sessions.niri;

  colors = import ./../../../.local/state/matugen/colors.nix;

  config = ''
    input {
        keyboard {
            xkb {
                layout "us"
            }
        }

        touchpad {
            tap
            natural-scroll
        }

        mouse {
            natural-scroll
        }

        trackpoint {
            natural-scroll
        }

        warp-mouse-to-focus

        focus-follows-mouse
    }

    output "${inbuilt.name}" {
        mode "1920x1080@60.00"
        scale 1
        transform "normal"
        position x=${inbuilt.position.x} y=${inbuilt.position.y}
    }

    output "${external}" {
        mode "1920x1080@60.00"
        scale 1
        transform "normal"
        position x=0 y=0
    }

    layout {
        gaps 8
        background-color "transparent"
        center-focused-column "never" // always on-overflow
        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        preset-window-heights {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
        }

        default-column-width {}

        focus-ring {
            off
        }

        border {
            width 1
            active-color "${colors.primary}"
            inactive-color "${colors.surface_container}"
            urgent-color "${colors.error}"
        }
        shadow {
            softness 30
            spread 5
            offset x=0 y=5
            color "#0007"
        }
        struts {
            left 1
            right -8
            top -3
            bottom -3
        }
    }

    // spawn-at-startup "swaync"
    // spawn-at-startup "waybar"
    spawn-at-startup "powermode-indicator"
    // spawn-at-startup "xwayland-satellite" ":1"
    // spawn-at-startup "vesktop"
    // spawn-at-startup "swaybg" "-i" "${wallpaper}" "-m" "fill"

    overview {
      zoom 0.6
      backdrop-color "${colors.surface_container_lowest}"
      workspace-shadow {
        off
      }
    }

    layer-rule {
      match namespace="^swww-daemon$"
      place-within-backdrop true
    }

    layer-rule {
      match namespace="^wallpaper$"
      place-within-backdrop true
    }


    gestures {
      hot-corners {
        off
      }
    }

    environment {
        DISPLAY ":1"
        _JAVA_AWT_WM_NONREPARENTING "1"
        ELECTRON_OZONE_PLATFORM_HINT "auto"
    }

    prefer-no-csd

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    animations {
        // off
    }

    window-rule {
        match app-id=r#"^org\.wezfurlong\.wezterm$"#
        default-column-width {}
    }

    window-rule {
        match app-id=r#"firefox$"# title="^Picture-in-Picture$"
        open-floating true
    }

    window-rule {
      match app-id="^waypaper$"
      open-floating true
    }

    window-rule {
      match app-id="^Bitwarden$"
      open-floating false
      block-out-from "screen-capture"
    }

    window-rule {
      match app-id="^blueberry.py$"
      open-floating true
    }

    window-rule {
      match app-id="^org.pulseaudio.pavucontrol$"
      open-floating true
    }

    window-rule {
      match app-id="^io.bassi.Amberol$"
      open-floating true
    }

    window-rule {
      match app-id="^blender$"
      opacity 1.0
    }

    window-rule {
      match app-id="^org.kde.kdenlive$"
      opacity 1.0
    }

    window-rule {
      match app-id="^ONLYOFFICE$"
      opacity 1.0
    }

    window-rule {
      match app-id="^xdg-desktop-portal-gtk$" title="^All Files"
      open-floating true
      min-width 400
      max-width 400
      min-height 400
      max-height 400
    }

    window-rule {
      match app-id="^org.gnome.Calculator$"
      open-floating true
      min-width 400
      max-width 400
      min-height 300
      max-height 300
    }

    window-rule {
      match app-id="^org.gnome.Chess$"
      open-floating true
    }

    window-rule {
      match app-id="brave-chatgpt.com__-Default"
      default-column-width { proportion 0.25; }
    }

    window-rule {
      match app-id="brave-gemini.google.com__app-Default"
      default-column-width { proportion 0.25; }
    }

    window-rule {
      match app-id="brave-search.nixos.org__packages-Default"
      default-column-width { proportion 0.25; }
    }

    window-rule {
        geometry-corner-radius 1
        clip-to-geometry true
        opacity 0.96
    }

    binds {
        Mod+Shift+Slash { show-hotkey-overlay; }

        Super+Alt+L hotkey-overlay-title="Lock the Screen: hyprlock" { spawn "hyprlock"; }
        Alt+Tab hotkey-overlay-title="Open a Terminal: foot" { spawn "foot"; }
        Alt+B { spawn "${browser}"; }
        Alt+C { spawn "brave" "--app=https://chatgpt.com"; }
        Alt+G { spawn "brave" "--app=https://gemini.google.com/app"; }
        Alt+E { spawn "thunar"; }
        Alt+A { spawn "fuzzel"; }
        Alt+Period { spawn "~/.config/fuzzel/scripts/emoji"; }
        Alt+V { spawn "bash" "-c" "pkill fuzzel || cliphist list | cut -f2- | fuzzel  --match-mode fzf --dmenu | cliphist decode | wl-copy"; }
        Alt+S { spawn "~/.config/fuzzel/scripts/powermenu.sh"; }
        Alt+P { spawn "swaync-client" "--toggle-panel"; }

        XF86AudioRaiseVolume allow-when-locked=true { spawn "swayosd-client" "--output-volume" "+5"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn "swayosd-client" "--output-volume" "-5"; }
        Alt+XF86AudioRaiseVolume allow-when-locked=true { spawn "swayosd-client" "--output-volume" "+1"; }
        Alt+XF86AudioLowerVolume allow-when-locked=true { spawn "swayosd-client" "--output-volume" "-1"; }
        XF86AudioMute        allow-when-locked=true { spawn "swayosd-client" "--output-volume" "mute-toggle"; }
        XF86AudioMicMute     allow-when-locked=true { spawn "swayosd-client" "--input-volume" "mute-toggle"; }

        XF86AudioMedia allow-when-locked=true { spawn "playerctl" "play-pause"; }
        XF86AudioPlay allow-when-locked=true { spawn "playerctl" "play-pause"; }
        XF86AudioPrev allow-when-locked=true { spawn "playerctl" "previous"; }
        XF86AudioNext allow-when-locked=true { spawn "playerctl" "next"; }

        XF86MonBrightnessUp allow-when-locked=true { spawn "swayosd-client" "--brightness" "+5"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "swayosd-client" "--brightness" "-5"; }
        Alt+XF86MonBrightnessUp allow-when-locked=true { spawn "swayosd-client" "--brightness" "+1"; }
        Alt+XF86MonBrightnessDown allow-when-locked=true { spawn "swayosd-client" "--brightness" "-1"; }

        XF86Search { spawn "blueberry"; }

        Mod+O repeat=false { toggle-overview; }

        Mod+Q { close-window; }

        Mod+H     { focus-column-left; }
        Mod+J     { focus-window-down; }
        Mod+K     { focus-window-up; }
        Mod+L     { focus-column-right; }

        Mod+Ctrl+H     { move-column-left; }
        Mod+Ctrl+J     { move-window-down; }
        Mod+Ctrl+K     { move-window-up; }
        Mod+Ctrl+L     { move-column-right; }

        // Alternative commands that move across workspaces when reaching
        // the first or last window in a column.
        // Mod+J     { focus-window-or-workspace-down; }
        // Mod+K     { focus-window-or-workspace-up; }
        // Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
        // Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }

        Mod+Home { focus-column-first; }
        Mod+End  { focus-column-last; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+End  { move-column-to-last; }

        Mod+Shift+H     { focus-monitor-left; }
        Mod+Shift+J     { focus-monitor-down; }
        Mod+Shift+K     { focus-monitor-up; }
        Mod+Shift+L     { focus-monitor-right; }

        Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

        // Mod+Shift+Ctrl+Left  { move-window-to-monitor-left; }

        // Mod+Shift+Ctrl+Left  { move-workspace-to-monitor-left; }

        Mod+Ctrl+Alt+J              { focus-workspace-down; }
        Mod+Ctrl+Alt+K              { focus-workspace-up; }

        Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
        Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
        Mod+Ctrl+U         { move-column-to-workspace-down; }
        Mod+Ctrl+I         { move-column-to-workspace-up; }

        // Alternatively, there are commands to move just a single window:
        // Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
        // ...

        Mod+Shift+Page_Down { move-workspace-down; }
        Mod+Shift+Page_Up   { move-workspace-up; }
        Mod+Shift+U         { move-workspace-down; }
        Mod+Shift+I         { move-workspace-up; }

        Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

        Mod+WheelScrollRight      { focus-column-right; }
        Mod+WheelScrollLeft       { focus-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollLeft  { move-column-left; }

        Mod+Shift+WheelScrollDown      { focus-column-right; }
        Mod+Shift+WheelScrollUp        { focus-column-left; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        Mod+Alt+1 { move-window-to-workspace 1; }
        Mod+Alt+2 { move-window-to-workspace 2; }
        Mod+Alt+3 { move-window-to-workspace 3; }
        Mod+Alt+4 { move-window-to-workspace 4; }
        Mod+Alt+5 { move-window-to-workspace 5; }
        Mod+Alt+6 { move-window-to-workspace 6; }
        Mod+Alt+7 { move-window-to-workspace 7; }
        Mod+Alt+8 { move-window-to-workspace 8; }
        Mod+Alt+9 { move-window-to-workspace 9; }

        Mod+Tab { focus-workspace-previous; }

        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }

        Mod+Comma  { consume-window-into-column; }
        Mod+Period { expel-window-from-column; }

        Mod+W { switch-preset-column-width; }
        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+Alt+W { switch-preset-window-height; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Mod+Ctrl+W { reset-window-height; }

        Mod+V { maximize-column; }
        Mod+F { fullscreen-window; }

        Mod+Ctrl+F { expand-column-to-available-width; }

        Mod+C { center-column; }
        Mod+Ctrl+C { center-visible-columns; }

        Mod+Space       { toggle-window-floating; }
        Alt+Space { switch-focus-between-floating-and-tiling; }

        Mod+T { toggle-column-tabbed-display; }

        // Actions to switch layouts.
        // Note: if you uncomment these, make sure you do NOT have
        // a matching layout switch hotkey configured in xkb options above.
        // Having both at once on the same hotkey will break the switching,
        // since it will switch twice upon pressing the hotkey (once by xkb, once by niri).
        // Mod+Space       { switch-layout "next"; }
        // Mod+Shift+Space { switch-layout "prev"; }

        Print { screenshot; }
        Ctrl+Print { screenshot-screen; }
        Alt+Print { screenshot-window; }

        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

        Ctrl+Alt+Delete { quit; }
        Mod+Shift+P { power-off-monitors; }
    }
  '';
in {
  config = mkIf cfg.enable {
    xdg.configFile."niri/config.kdl".text = config;
  };
}
