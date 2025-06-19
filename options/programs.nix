{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkOption types;
in {
  options = {
    bifrost = {
      programs = {
        editors = {
          default = mkOption {
            type = types.str;
            default = "neovim";
            description = "Your default text editor. Will be used for $VISUAL and $EDITOR";
          };
          neovim.enable = mkEnableOption "Whether to enable neovim";
          vscode.enable = mkEnableOption "Whether to enable vscode";
          zed.enable = mkEnableOption "Whether to enable zed";

          obsidian.enable = mkEnableOption "Whether to enable obsidian";
          onlyoffice.enable = mkEnableOption "Whether to enable onlyoffice";
        };
        pentest = {
          enable = mkEnableOption "Install base pentesting applications";
          full = mkOption {
            type = types.bool;
            default = false;
            description = "Install full pentesting applications";
          };
        };
        games = {
          chess.enable = mkEnableOption "Installs gnome-chess and stockfish chess engine";
          steam.enable = mkEnableOption "Enables steam";
        };
        terminals = {
          default = mkOption {
            type = types.str;
            default = "foot";
            description = "Your preferred terminal";
          };
          foot = {
            enable = mkEnableOption "the foot terminal emulator";
          };
        };
        git = {
          enable = mkEnableOption "Whether to enable git";

          userName = mkOption {
            type = types.str;
            default = "sa" + "mm" + "ha" + "ns" + "en";
            description = "Your desired username for git operations";
          };
          userEmail = mkOption {
            type = types.str;
            default = "sa" + "m" + "han" + "sen" + "." + "dev" + "@" + "gm" + "ail" + ".c" + "om";
            description = "The email to use for git operations";
          };
        };
        obs.enable = mkEnableOption "Whether to enable OBS for screen recording";
        qbittorrent.enable = mkEnableOption "Enables qbittorent";

        browsers = {
          default = mkOption {
            type = types.str;
            default = "brave";
            description = ''
              The default browser you prefer.This value will be used in keybinds and stuff
            '';
          };
          xdg = mkOption {
            type = types.str;
            default = "brave-browser.desktop";
            description = ''
              The default browser you prefer.This value will be set in xdg.MimeApps
            '';
          };
          brave.enable = mkEnableOption "Whether to enable brave browser";
          chrome.enable = mkEnableOption "Whether to enable chrome browser";
          qute.enable = mkEnableOption "Whether to enable qute browser";
          floorp.enable = mkEnableOption "Whether to enable floorp browser";
          firefox.enable = mkEnableOption "Whether to enable firefox browser";
          tor-browser.enable = mkEnableOption "Whether to enable tor-browser";
        };
        media = {
          amberol.enable = mkEnableOption "Whether to enable amberol";
          mpv.enable = mkEnableOption "Whether to enable mpv";
          spotify.enable = mkEnableOption "Whether to enable spotify";
          yt-music.enable = mkEnableOption "Whether to enable youtube-music";
          zathura.enable = mkEnableOption "Whether to enable zathura";
        };
        socials = {
          nixcord.enable = mkEnableOption "Whether to enable nixcord";
          whatapp = {
            enable = mkEnableOption ''
              This options enables zapzap , a unofficial whatapp client for linux
            '';
            package = mkOption {
              type = types.package;
              default = pkgs.zapzap;
              description = ''
                The whatsapp client to use
                ie; pkgs.whatsie
              '';
            };
            spawn = mkOption {
              type = types.str;
              default = "${pkgs.zapzap}/bin/zapzap";
              description = ''
                The command to run as spawn-at-startup
              '';
            };
          };
          zoom.enable = mkEnableOption "Whether to enable zoom";
          matrix = {
            enable = mkEnableOption ''
              This option enables element , a crossplatform matrix client
            '';
            package = mkOption {
              type = types.package;
              default = pkgs.element-desktop;
              description = ''
                The matrix client to use
                ie; pkgs.nheko
              '';
            };
          };
          telegram = {
            enable = mkEnableOption ''
              This option enable AyuTelegram. An opensource telegram client
            '';
            package = mkOption {
              type = types.package;
              default = pkgs.ayugram-desktop;
              description = ''
                The telegram client to use
                ie; pkgs.telegram-desktop
              '';
            };
          };
          thunderbird.enable = mkEnableOption "Whether to enable ";
          newsboat.enable = mkEnableOption "Whether to enable newsboat";
        };
      };
    };
  };
}
