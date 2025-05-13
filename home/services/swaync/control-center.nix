{...}: let
  colors = import ../../../.local/state/matugen/colors.nix;
in {
  home.file.".config/swaync/control-center.css".text = ''
    @define-color bg                          ${colors.background};
    @define-color on-bg                       ${colors.on_background};
    @define-color selected                    ${colors.primary};
    @define-color bg-primary                  ${colors.primary_container};
    @define-color on-bg-primary               ${colors.on_primary_container};
    @define-color bg-secondary                ${colors.secondary_container};
    @define-color on-bg-secondary             ${colors.on_secondary_container};
    @define-color bg-surface                  ${colors.surface_container};
    @define-color on-bg-surface               ${colors.on_surface}; /* fallback; see note below */
    @define-color bg-surface-highest          ${colors.surface_container_highest};
    @define-color on-bg-surface-highest       ${colors.on_surface}; /* fallback again */
    @define-color tertiary                    ${colors.tertiary};
    @define-color on-bg-tertiary              ${colors.on_tertiary_container};
    @define-color hover                       alpha(${colors.primary}, .4);
    @define-color urgent                      ${colors.error_container};

    * {
      color: @text;
      all: unset;
      font-size: 16px;
      font-family: "SpaceMono Nerd Font";
      font-weight: normal;
      transition: 200ms;
    }

    .control-center {
      background: @bg;
      border-radius: 3px;
      padding: 9px;
      margin: 0px;
    }

    /* buttons grid */

    .widget-buttons-grid {
      margin: 0px;
      background: transparent;
      color: @on-bg-surface;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button {
      margin: 3px;
      padding: 6px 12px;
      background: @bg-surface-highest;
      color: @on-bg-surface;
      border-radius: 3px;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button:hover {
      background: @bg-surface;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
      background: @bg-primary;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked label {
      color: @on-bg-primary;
    }

    /* notifications */

    .notification-row .notification-background {
      background: @bg-surface;
      padding: 4px;
      border-radius: 4px;
      margin: 5px 5px 5px 5px;
    }

    .summary {
      font-size: 15px;
      /* font-weight: bold; */
      background: transparent;
      color: @on-bg-tertiary;
      margin-left: 0px;
      /* text-shadow: 0 0 3px @red; */
    }

    /* === TIMESTAMP === */
    .time {
      font-size: 11px;
      font-style: italic;
      background: transparent;
      color: @on-bg-tertiary;
      text-shadow: none;
      margin: 3px 10px 0px 0px;
    }

    .image {
      background: transparent;
      border-radius: 99px;
      margin: 0px 10px 3px 2px;
    }

    .body {
      font-size: 13px;
      font-weight: normal;
      background: transparent;
      color: @on-surface-container;
      text-shadow: none;
      margin-left: 0px;
    }

    .notification-group-headers {
      font-weight: bold;
      font-size: 11pt;
      color: @tertiary;
    }

    .notification-group-icon {
      color: @bg-surface-highest;
      margin-right: 8px;
    }

    .notification-group-collapse-button {
      background: @bg-primary;
      border: none;
      min-width: 24px;
      min-height: 24px;
    }

    .notification-group-collapse-button:hover {
      background: @bg-primary;
      color: @on-bg-primary;
    }

    .notification-group-close-all-button {
      background: @bg-primary;
      border: none;
      min-width: 24px;
      min-height: 24px;
    }

    .notification-group-close-all-button:hover {
      background: @bg-primary;
      color: @on-bg-primary;
    }

    .notification-default-action,
    .notification-action {
      padding: 4px;
      margin: 0;
      box-shadow: none;
      background: transparent;
      border: none;
      color: @on-bg-surface;
      transition: all 0.15s ease-in-out;
      font-size: 11pt;
    }

    .notification-default-action:hover,
    .notification-action:hover {
      -gtk-icon-effect: none;
      background: @bg-primary;
      /* text-shadow: 0 0 3px @surface; */
    }

    .notification-default-action {
      border-radius: 8px;
    }

    .notification-default-action:not(:only-child) {
      border-bottom-left-radius: 0;
      border-bottom-right-radius: 0;
    }

    .notification-action {
      border-radius: 0;
      border-top: none;
      border-right: none;
    }

    .notification-action:first-child {
      border-bottom-left-radius: 10px;
      background: @bg-surface-highest;
    }

    .notification-action:last-child {
      border-bottom-right-radius: 10px;
      background: @bg-surface-highest;
    }

    .inline-reply {
      margin-top: 8px;
    }

    .inline-reply-entry {
      background: @bg-secondary;
      color: @on-bg-secondary;
      caret-color: @bg-secondary;
      border: 1px solid @background;
      border-radius: 10px;
    }

    .inline-reply-button {
      margin-left: 4px;
      background: @tertiary-container;
      border: 1px solid @background;
      border-radius: 10px;
      color: @on-tertiary-container;
    }

    .inline-reply-button:disabled {
      background: initial;
      color: @surface-disabled;
      border: 1px solid transparent;
    }

    .inline-reply-button:hover {
      background: @surface;
    }

    /* Music player */
    .widget-mpris {
      /* background: alpha(@selected, 0.2); */
      border-radius: 3px;
      color: @on-bg-primary;
      padding: 6px;
      margin: 20px 6px;
    }

    .widget-mpris button {
      color: alpha(@on-bg-primary, 0.9);
      border-radius: 4px;
    }

    .widget-mpris button:hover {
      color: @text;
    }

    /* NOTE: Background need *opacity 1* otherwise will turn into the album art blurred  */
    .widget-mpris-player {
      padding: 2px;
      /* background: @surface_container; */
      margin: 2px 4px 4px 2px;
      border-radius: 3px;
    }

    .widget-mpris-album-art {
      border-radius: 3px;
    }

    .widget-mpris-title {
      font-weight: 700;
      font-size: 15px;
    }

    .widget-mpris-subtitle {
      font-weight: 500;
      font-size: 13px;
    }

    progressbar,
    progress,
    trough {
      border-radius: 3px;
      min-height: 20px;
      background: @bg-surface-highest;
      /* background: @primary-container; */
    }

    trough highlight {
      padding: 4px;
      background: @primary_container;
      /* background: @bg-surface-highest; */
      border-radius: 3px;
      box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
    }
    trough slider {
      background: transparent;
    }
    trough slider:hover {
      background: transparent;
    }

    .widget-volume {
      background: @bg-surface;
      padding: 2px 4px 2px 4px;
      margin: 4px 4px 1px 4px;
      border-radius: 4px;
      /* font-size: x-large; */
      color: @on-bg-surface;
    }

    .widget-volume > box > button {
      background: transparent;
      border: none;
    }

    .widget-backlight {
      background: @bg-surface;
      color: @on-bg-surface;
      padding: 2px 4px 2px 4px;
      margin: 1px 4px 4px 4px;
      border-radius: 6px;
    }
    .widget-backlight > box > button {
      background: transparent;
      border: none;
    }
  '';
}
