{
  bifrost = rec {
    user = {
      name = "Ha" + "ns" + "en";
      username = "ta" + "ma" + "ra";
      locale = "en_US.UTF-8";
      timezone = "Af" + "ri" + "ca" + "/" + "Na" + "ir" + "obi";
    };
    programs = {
      editors = {
        default = "neovim";
        neovim.enable = true;
        vscode.enable = true;
        zed.enable = true;

        obsidian.enable = true;
        onlyoffice.enable = true;
      };
      pentest = {
        enable = true;
        full = false;
      };
      games = {
        chess.enable = true;
        steam.enable = false;
      };
      terminals = {
        default = "foot";
        foot.enable = true;
      };
      git = {
        enable = true;
        userName = "sa" + "mm" + "ha" + "ns" + "en";
        userEmail = "sa" + "m" + "han" + "sen" + "." + "dev" + "@" + "gm" + "ail" + ".c" + "om";
      };
      browsers = {
        default = "brave";
        xdg = "brave-browser.desktop";
        brave.enable = true;
        chrome.enable = true;
        floorp.enable = false;
        firefox.enable = false;
        qute.enable = false;
        tor-browser.enable = false;
      };
      media = {
        amberol.enable = false;
        mpv.enable = true;
        spotify.enable = true;
        yt-music.enable = true;
        zathura.enable = true;
      };
      socials = {
        nixcord.enable = true;
        whatapp = {
          enable = true;
          # package = pkgs.zapzap;
          # spawn = "${pkgs.zapzap}/bin/zapzap";
        };
        zoom.enable = false;
        matrix = {
          enable = true;
          # package = pkgs.element-desktop;
        };
        telegram = {
          enable = true;
          # package = pkgs.ayugram-desktop;
        };
        thunderbird.enable = false;
        newsboat.enable = true;
      };
      obs.enable = true;
      qbittorrent.enable = false;
    };
    services = {
      easyeffects = {
        enable = true;
      };
    };
    displayManager = {
      default = "sddm"; #ly
    };
    windowManager = {
      gnome.enable = true;
      niri.enable = true;
    };
    LGBTheme = {
      lockscreen = "/home/${user.name}/Pictures/wallpapers/nature-girl.jpg";
      font = {
        size = 11;
        main = {
          name = "SpaceMono Nerd Font";
          variant = "Regular";
        };

        sans-serif = {
          name = "SpaceMono Nerd Font";
          variant = "Regular";
        };
        mono-space = {
          name = "SpaceMono Nerd Font";
          variant = "Regular";
        };
      };
    };
    monitors = let
      T460s-14 = "eDP-1";
      Dell-P2419H = "HDMI-A-2";
    in {
      main = "${Dell-P2419H}";
      inbuilt = {
        name = "${T460s-14}";
        position = {
          x = 0;
          y = 1080;
        };
      };
      external = {
        name = "${Dell-P2419H}";
      };
    };
    virtualisation = {
      enable = true;
      libvirt.enable = true;
      bottles.enable = false;
      distrobox.enable = true;
      docker.enable = true;
      podman.enable = false;
      ollama.enable = false;
    };
    device = {
      system = "x86_64-linux";
      hostname = "he" + "ll";
      flakeDir = "/home/${user.name}/.nixos";
      walDir = "/home/${user.name}/Pictures/wallpapers";
      keyLayout = "us";
      dualBoot = true;
      isLaptop = true;
      isIntel = true;
      isServer = false;
    };
  };
}
