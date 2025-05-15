{
  bifrost,
  pkgs,
  ...
}: let
  colors = import ../../../../.local/state/matugen/colors.nix;
  font = {
    name = bifrost.themes.font.name;
    size = builtins.toString bifrost.themes.font.size;
  };
  theme = ''
    configuration {
        modi:                       "drun,window";
        show-icons:                 true;
        display-drun:               " ";
        display-window:               " ";
        drun-display-format:        "{name}";
    }

    * {
        font: "${font.name} ${font.size}";
        background:     ${colors.background};
        background-alt: ${colors.tertiary_container};
        foreground:     ${colors.on_primary_container};
        selected:       ${colors.secondary_container};
        active:         ${colors.inverse_primary};
        urgent:         ${colors.error};
    }

    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  false;
        width:                       400px;
        x-offset:                    0px;
        y-offset:                    0px;

        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            @background;
        cursor:                      "default";
    }

    mainbox {
        enabled:                     true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @selected;
        background-color:            transparent;
        children:                    [ "inputbar", "listview" ];
    }

    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     15px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            @background;
        text-color:                  @foreground;
        children:                    [ "prompt", "entry" ];
    }

    prompt {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            inherit;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            inherit;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search...";
        placeholder-color:           inherit;
    }

    /*****----- Listview -----*****/
    listview {
        enabled:                     true;
        columns:                     1;
        lines:                       6;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;

        spacing:                     5px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }
    scrollbar {
        handle-width:                5px ;
        handle-color:                @selected;
        border-radius:               0px;
        background-color:            @background-alt;
    }

    /*****----- Elements -----*****/
    element {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0px;
        padding:                     8px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            @background;
        text-color:                  @foreground;
    }
    element selected.normal {
        background-color:            @background-alt;
        text-color:                  @foreground;
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        32px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.0;
    }

    /*****----- Message -----*****/
    error-message {
        padding:                     15px;
        border:                      2px solid;
        border-radius:               12px;
        border-color:                @selected;
        background-color:            @background;
        text-color:                  @foreground;
    }
    textbox {
        background-color:            @background;
        text-color:                  @foreground;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
    }
  '';
in {
  imports = [
    ./clip.nix
    ./emoji.nix
  ];

  programs.rofi = {
    enable = true;
  };

  home.packages = with pkgs; [
    rofi-rbw-wayland
    rbw
    pinentry-curses
    pinentry-rofi
  ];

  home.file.".config/rofi/theme.rasi".text = theme;
}
