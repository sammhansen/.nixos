{
  lib,
  bifrost,
  isServer,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = bifrost;

  browser = "${cfg.programs.browsers.xdg}";
in {
  config = mkIf (!isServer) {
    xdg = {
      enable = true;

      mimeApps = {
        enable = true;
        associations.added = {
          "audio/mpeg" = ["org.gnome.Totem.desktop"];
          "image/jpeg" = ["org.gnome.Loupe.desktop"];
          "image/jpg" = ["org.gnome.eog.desktop"];
          "image/png" = ["org.gnome.Loupe.desktop"];
          "video/mp3" = ["org.gnome.Totem.desktop"];
          "video/mp4" = ["org.gnome.Totem.desktop"];
          "video/quicktime" = ["org.gnome.Totem.desktop"];
          "video/webm" = ["org.gnome.Totem.desktop"];
          "x-scheme-handler/tg" = ["org.telegram.desktop"];
        };
        defaultApplications = {
          "application/x-extension-htm" = browser;
          "application/x-extension-html" = browser;
          "application/x-extension-shtml" = browser;
          "application/x-extension-xht" = browser;
          "application/x-extension-xhtml" = browser;
          "application/xhtml+xml" = browser;
          "text/html" = browser;
          "x-scheme-handler/about" = browser;
          "x-scheme-handler/chrome" = ["google-chrome.desktop"];
          "x-scheme-handler/ftp" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "x-scheme-handler/unknown" = browser;

          "application/json" = ["code.desktop"];
          "application/pdf" = browser;
          "application/toml" = "code.desktop";
          "application/x-gnome-saved-search" = ["org.gnome.Nautilus.desktop"];
          "audio/*" = ["org.gnome.Totem.dekstop"];
          "audio/mp3" = ["org.gnome.Totem.dekstop"];
          "image/*" = ["org.gnome.eog.desktop"];
          "image/jpg" = ["org.gnome.loupe.desktop"];
          "image/png" = ["org.gnome.loupe.desktop"];
          "text/plain" = "org.gnome.TextEditor.desktop";
          "video/*" = ["org.gnome.Totem.desktop"];
          "video/mp4" = ["org.gnome.Totem.desktop"];
          "x-scheme-handler/spotify" = ["spotify.desktop"];
          "x-scheme-handler/tg" = ["org.telegram.desktop"];
        };
      };

      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };
}
