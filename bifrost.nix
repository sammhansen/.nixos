{
  bifrost = {
    userconf = {
      name = "Hansen";
      username = "lilith";
      editor = "neovim";
      dotsdir = "atlantis";
    };
    sysconf = {
      system = "x86_64-linux";
      host = "atlantis";
      locale = "en_US.UTF-8";
      timezone = "Africa/Nairobi";
      hardwareclock = true;
      keyboardlayout = "us";
    };

    hardware = {
      intel.enable = true;
      islaptop = true;
    };

    monitors = {
      default = "HDMI-A-2";
      inbuilt = "eDP-1";
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
      qtile.enable = false;
      sway.enable = false;
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
        android_studio.enable = false;
      };
      langs = {
        nodejs.enable = false;
      };
    };

    virtualisation = {
      distrobox = {
        kali.hostname = "kali";
      };
      podman.enable = false;
      docker.enable = false;
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
      printing.enable = true;
    };
  };
}
