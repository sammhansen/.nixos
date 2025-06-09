{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 1;
        };
      };
      display = {
        size = {
          binaryPrefix = "si";
        };
        color = "blue";
        separator = "  ";
      };
      modules = [
        "title"
        "break"
        "os"
        "kernel"
        "shell"
        "display"
        "de"
        "wm"
        "font"
        "terminal"
        "cpu"
        "gpu"
      ];
    };
  };
}
