{
  username,
  bifrost,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkForce;
  cfg = bifrost.themes;

  bookmarks = [
    "file:///home/${username}/Developer"
    "file:///home/${username}/Documents"
    "file:///home/${username}/Music"
    "file:///home/${username}/Pictures"
    "file:///home/${username}/Videos"
    "file:///home/${username}/Downloads"
  ];
in {
  gtk = {
    enable = true;

    # cursorTheme = mkForce {
    #   name = "Catppuccin-Mocha-Dark-Cursors";
    #   package = pkgs.catppuccin-cursors.mochaDark;
    # };

    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };

    font = {
      name = cfg.font.name;
      package = pkgs.nerd-fonts.space-mono;
      size = cfg.font.size;
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
        # make things look nice
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

      bookmarks = bookmarks;
    };

    gtk4 = {
      extraConfig = {
        # make things look nice
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
    };
  };
}
