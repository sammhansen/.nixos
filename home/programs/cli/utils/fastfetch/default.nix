{colors, ...}: let
  keyColor = colors.tertiary.hex;
in {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        source = ./frieren.txt;
        padding = {
          right = 1;
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "${keyColor}";
        separator = "  ";
      };
      modules = [
        {
          type = "title";
          key = "";
          keyColor = "${keyColor}";
        }
        "break"
        {
          type = "os";
          key = "";
          keyColor = "${keyColor}";
        }
        {
          type = "kernel";
          key = "";
          keyColor = "${keyColor}";
        }
        {
          type = "packages";
          key = "󰏖";
          keyColor = "${keyColor}";
        }
        {
          type = "uptime";
          key = "󰔛";
          keyColor = "${keyColor}";
        }

        {
          type = "wm";
          key = "";
          keyColor = "${keyColor}";
        }
        {
          type = "terminal";
          key = "";
          keyColor = "${keyColor}";
        }
        {
          type = "shell";
          key = "";
          keyColor = "${keyColor}";
        }
      ];
    };
  };
}
