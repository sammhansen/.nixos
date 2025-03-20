{...}: {
  programs.kitty = {
    enable = true;
    font.name = "Iosevka Nerd Font";
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
