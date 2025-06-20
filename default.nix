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
        whatsapp = {
          enable = true;
          package = "zapzap";
        };
        zoom.enable = false;
        matrix = {
          enable = true;
          package = "element";
        };
        telegram = {
          enable = true;
          package = "ayugram";
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
        fixed-quantum = false;
      };
    };
    displayManager = {
      default = "sddm"; #ly
    };
    windowManager = {
      gnome.enable = false;
      niri.enable = true;
    };
    LGBTheme = {
      lockscreen = "/home/${user.username}/Pictures/wallpapers/nature-girl.jpg";
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
      libvirt.enable = false;
      bottles.enable = false;
      distrobox.enable = true;
      docker.enable = true;
      podman.enable = false;
      ollama.enable = false;
      waydroid.enable = false;
    };
    dev = {
      #sometimes I just find myself without internet so I have this because nix-shells tend to download stuff everytime am activating them.This is not the recommended way
      rust.enable = false;
      dotnet.enable = false;
      npm.enable = false;
      python.enable = false;
    };
    device = {
      system = "x86_64-linux";
      hostname = "he" + "ll";
      flakeDir = "/home/${user.username}/.nixos";
      walDir = "/home/${user.name}/Pictures/wallpapers";
      keyLayout = "us";
      dualBoot = true;
      isLaptop = true;
      isIntel = true;
      isServer = false;
    };
  };
}
