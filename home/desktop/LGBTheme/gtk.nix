{
  isServer,
  username,
  colors,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.bifrost;

  bookmarks = [
    "file:///home/${username}/Developer"
    "file:///home/${username}/Documents/eNt/Anime"
    "file:///home/${username}/Documents"
    "file:///home/${username}/Music"
    "file:///home/${username}/Pictures"
    "file:///home/${username}/Videos"
    "file:///home/${username}/Downloads"
  ];
  css = ''
    @define-color accent_color ${colors.primary.hex};
    @define-color accent_bg_color ${colors.primary_container.hex};
    @define-color accent_fg_color ${colors.on_primary_container.hex};
    @define-color destructive_color ${colors.error.hex};
    @define-color destructive_bg_color ${colors.error_container.hex};
    @define-color destructive_fg_color ${colors.on_error_container.hex};
    @define-color success_color ${colors.secondary.hex};
    @define-color success_bg_color ${colors.secondary_container.hex};
    @define-color success_fg_color ${colors.on_secondary_container.hex};
    @define-color warning_color ${colors.tertiary.hex};
    @define-color warning_bg_color ${colors.tertiary_container.hex};
    @define-color warning_fg_color ${colors.on_tertiary_container.hex};
    @define-color error_color ${colors.error.hex};
    @define-color error_bg_color ${colors.error_container.hex};
    @define-color error_fg_color ${colors.on_error_container.hex};
    @define-color window_bg_color ${colors.surface.hex};
    @define-color window_fg_color ${colors.on_surface.hex};
    @define-color view_bg_color ${colors.surface.hex};
    @define-color view_fg_color ${colors.on_surface.hex};
    @define-color headerbar_bg_color @window_bg_color;
    @define-color headerbar_fg_color @window_fg_color;
    @define-color headerbar_border_color @window_bg_color;
    @define-color headerbar_backdrop_color @window_bg_color;
    @define-color headerbar_shade_color @window_bg_color;
    @define-color card_bg_color ${colors.surface_container_high.hex};
    @define-color card_fg_color ${colors.on_surface.hex};
    @define-color card_shade_color rgba(0, 0, 0, 0.07);
    @define-color dialog_bg_color @card_bg_color;
    @define-color dialog_fg_color @card_fg_color;
    @define-color popover_bg_color @card_bg_color;
    @define-color popover_fg_color @card_fg_color;
    @define-color shade_color rgba(0, 0, 0, 0.36);
    @define-color scrollbar_outline_color rgba(139, 145, 152, 0.5);
    @define-color sidebar_bg_color ${colors.surface_container_low.hex};
    @define-color secondary_sidebar_bg_color @sidebar_bg_color;
    @define-color sidebar_backdrop_color @sidebar_bg_color;
    @define-color secondary_sidebar_backdrop_color @sidebar_bg_color;

    .navigation-sidebar {
      background-color: @sidebar_bg_color;
      color: @window_fg_color;
    }

    headerbar.default-decoration {
      margin-bottom: 50px;
      margin-top: -100px;
    }

    window.csd,
    window.csd decoration {
      box-shadow: none;
    }

    switch {
      background-color: @accent_color;
    }

    scale {
      border-color: @scrollbar_outline_color;
    }

    scale slider {
      background-color: @accent_color;
    }

    scale slider:active {
      background-color: @scrollbar_outline_color;
    }

    scale trough {
      background-color: @accent_color;
      color: @accent_color;
    }

    scale trough progress {
      background-color: @accent_color;
    }
  '';
in {
  config = mkIf (!isServer) {
    gtk = {
      enable = true;
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      font = {
        name = cfg.LGBTheme.font.main.name;
        package = pkgs.nerd-fonts.space-mono;
        size = cfg.LGBTheme.font.size;
      };

      gtk2 = {
        configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
        extraConfig = ''
          gtk-xft-antialias=1
          gtk-xft-hinting=1
          gtk-xft-hintstyle="hintslight"
          gtk-xft-rgba="rgb"
        '';
      };

      gtk3 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = true;

          gtk-decoration-layout = "appmenu:none";

          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintslight";

          # stop annoying sounds
          gtk-enable-event-sounds = 0;
          gtk-enable-input-feedback-sounds = 0;
          gtk-error-bell = 0;

          # config that is not the same as gtk4
          gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
          gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";

          gtk-button-images = 1;
          gtk-menu-images = 1;
        };

        extraCss = css;

        bookmarks = bookmarks;
      };

      gtk4 = {
        extraConfig = {
          gtk-application-prefer-dark-theme = true;

          gtk-decoration-layout = "appmenu:none";

          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintslight";

          # stop annoying sounds again
          gtk-enable-event-sounds = 0;
          gtk-enable-input-feedback-sounds = 0;
          gtk-error-bell = 0;
        };

        extraCss = css;
      };
    };
  };
}
