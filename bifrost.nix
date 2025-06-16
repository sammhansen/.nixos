{
  bifrost = rec {
    userconf = {
      name = "Ha" + "ns" + "en";
      username = "ta" + "ma" + "ra";
      editor = "neovim";
      dotsdir = ".nixos";
    };
    sysconf = {
      system = "x86_64-linux";
      host = "he" + "ll";
      locale = "en_US.UTF-8";
      timezone = "Af" + "ri" + "ca" + "/" + "Na" + "ir" + "obi";
      osprober = true;
      hardwareclock = true;
      keyboardlayout = "us";
    };

    hardware = {
      intel.enable = true;
      islaptop = true;
    };

    monitors = {
      default = "HDMI-A-2";
      inbuilt = {
        name = "eDP-1";
        position = {
          x = "1920";
          y = "850";
        };
      };
      external = {
        enable = true;
        name = "HDMI-A-2";
      };
    };

    sessions = {
      dm = "sddm";
      gnome.enable = false;
      niri.enable = true;
    };

    themes = {
      wallpaper = "/home/${userconf.username}/Pictures/wallpapers/catgirl.png";
      lock-wallpaper = "/home/${userconf.username}/Pictures/wallpapers/nature-girl.jpg";
      font = {
        name = "SpaceMono Nerd Font";
        monospace = {
          name = "SpaceMono Nerd Font";
          variant = "Regular";
        };
        sansSerif = {
          name = "Noto Sans";
          variant = "Regular";
        };

        size = 11;
      };
    };

    terminals = {
      default = "foot";
      foot.enable = true;
    };

    browsers = {
      default = "brave";
      brave.enable = true;
      chrome.enable = true;
      floorp.enable = true;
      firefox.enable = false;
      zen.enable = false;
      tor-browser.enable = true;
      qute.enable = false;
    };

    dev = {
      enable = true;

      editors = {
        vscode.enable = true;
        zeditor.enable = false;
      };
      ides = {
        androidstd.enable = false;
      };
      langs = {
        nodejs.enable = false;
        flutter.enable = false;
      };
      dbs = {
        mysql.enable = false;
        postgresql.enable = false;
      };
    };

    virtualisation = {
      enable = true;

      distrobox = {
        kali.hostname = "kali";
      };
      bottles.enable = false;
      podman.enable = false;
      docker.enable = true;
      ollama.enable = false;
      waydroid.enable = true;
      emulator.enable = false;
    };

    pentester = {
      enable = true;
    };

    git = {
      username = "sa" + "mm" + "han" + "sen";
      email = "sa" + "m" + "han" + "sen" + "dev" + "@" + "gm" + "ail" + "co" + "m";
    };

    shells = {
      default = "fish";
      zsh.enable = true;
      fish.enable = true;
    };

    extra = {
      filemanager = "thunar";
      flatpak.enable = true;
      printing.enable = false;
    };
  };
}
