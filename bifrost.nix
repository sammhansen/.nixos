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
      host = "atlantis";
      locale = "en_US.UTF-8";
      timezone = "Africa/Nairobi";
      osprober = false;
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
        position = "0x1080";
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
      xwayland.enable = true;
      niri.enable = false; # niri conflicts with xwayland..disable xwayland above
    };

    themes = {
      font = {
        name = "SpaceMono Nerd Font";
        size = "17";
      };
      catppuccin = {
        flavor = "mocha";
        accent = "pink";
      };
    };

    terminals = {
      default = "foot";
      kitty.enable = false;
      foot.enable = true;
      ghostty.enable = false;
      wezterm.enable = false;
    };

    browsers = {
      default = "chromium";
      firefox.enable = true;
      zen.enable = true;
      tor-browser.enable = true;
      chrome.enable = true;
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
      podman.enable = true;
      docker.enable = true;
      ollama.enable = false;
      waydroid.enable = false;
      emulator.enable = false;
    };

    pentester = {
      enable = true;
    };

    git = {
      username = "sammhansen";
      email = "samhansen.dev@gmail.com";
    };

    shells = {
      default = "zsh";
      zsh.enable = true;
      fish.enable = true;
    };

    extra = {
      flatpak.enable = false;
      printing.enable = false;
    };
  };
}
