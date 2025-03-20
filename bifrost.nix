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
      inbuilt = "eDP-1";
      thinkvision = {
        enable = true;
        name = "HDMI-A-2";
      };
    };

    sessions = {
      dm = "sddm"; #tui-greet
      gnome.enable = true;
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
      kitty.enable = true;
      foot.enable = true;
      wezterm.enable = false;
    };

    browsers = {
      default = "chromium";
      firefox.enable = true;
      chromium.enable = true;
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
      flatpak.enable = true;
      printing.enable = true;
    };
  };
}
