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

    sessions = {
      gnome.enable = true;
      hyprland.enable = true;
      xwayland.enable = true;
      niri.enable = false; # niri conflicts with xwayland..disable xwayland first
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
      kitty.enable = true;
      foot.enable = true;
      wezterm.enable = false;
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
