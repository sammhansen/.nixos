{
  bifrost = {
    userconf = {
      name = "Hansen";
      username = "tamara";
      editor = "neovim";
      dotsdir = "atlantis";
    };
    sysconf = {
      system = "x86_64-linux";
      host = "hell";
      locale = "en_US.UTF-8";
      timezone = "Africa/Nairobi";
      osprober = false;
      hardwareclock = false;
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
          x = "0";
          y = "1080";
        };
      };
      external = {
        enable = true;
        name = "HDMI-A-2";
      };
    };

    sessions = {
      dm = "sddm"; #tui-greet
      gnome.enable = false;
      hyprland.enable = true;
    };

    themes = {
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
      kitty.enable = false;
      ghostty.enable = false;
      wezterm.enable = false;
    };

    browsers = {
      default = "chromium";
      firefox.enable = false;
      floorp.enable = true;
      zen.enable = false;
      tor-browser.enable = true;
      chrome.enable = false;
      chromium.enable = true;
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
        nodejs.enable = true;
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
      podman.enable = true;
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
