{
  lib,
  colors,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;

  style = ''
    @define-color bg               ${colors.background.hex};
    @define-color on-bg            ${colors.on_background.hex};
    @define-color bg-alt           ${colors.surface_bright.hex};
    @define-color on-bg-alt        ${colors.on_surface_variant.hex};
    @define-color selected         ${colors.primary.hex};
    @define-color hover            alpha(${colors.primary.hex}, .4);
    @define-color urgent           ${colors.error_container.hex};

    * {
      color: @on-bg;
      all: unset;
      font-size: 16px;
      font-family: "SpaceMono Nerd Font";
      transition: 200ms;
    }

    .notification-row {
      color: @on-bg;
      outline: none;
      margin: 0;
      padding: 0px;
    }

    .floating-notifications.background .notification-row .notification-background {
      background: @bg;
      box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.6);
      border: 0px;
      border-radius: 3px;
      margin: 16px;
      padding: 0px;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification {
      padding: 3px;
      border-radius: 3px;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification.critical {
      border: 2px solid @urgent;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification
      .notification-content {
      margin: 3px;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification
      > *:last-child
      > * {
      min-height: 3.4em;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification
      > *:last-child
      > *
      .notification-action {
      all: unset;
      border-radius: 4px;
      background-color: @bg-alt;
      font-size: 5px;
      margin: 40px;
      font-weight: 200;
      min-height: 12px;
      padding: 0px;
      border: 1px solid transparent;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification
      > *:last-child
      > *
      .notification-action:hover {
      background-color: @hover;
      border: 1px solid @selected;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .notification
      > *:last-child
      > *
      .notification-action:active {
      background-color: @selected;
      color: @background;
    }

    .image {
      margin: 10px 20px 10px 0px;
    }

    .summary {
      font-weight: 800;
      font-size: 1rem;
      color: @on-bg;
    }

    .body {
      font-size: 0.8rem;
      color: @on-bg;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .close-button {
      margin: 6px;
      padding: 2px;
      border-radius: 3px;
      background-color: transparent;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .close-button:hover {
      background-color: @selected;
      color: @background;
    }

    .floating-notifications.background
      .notification-row
      .notification-background
      .close-button:active {
      background-color: @selected;
      color: @background;
    }

    .notification.critical progress {
      background-color: @selected;
    }

    .notification.low progress,
    .notification.normal progress {
      background-color: @selected;
    }
  '';
in {
  config = mkIf (!isServer && isWayland) {
    xdg.configFile."swaync/notifications.css".text = style;
  };
}
