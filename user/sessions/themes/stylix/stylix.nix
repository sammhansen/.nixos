{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../../../../.config/wallpapers/bunny.png;
    base16Scheme = ./themes/catppuccin-mocha/catppuccin-mocha.yaml;
    polarity = "dark";
    targets = {
      btop.enable = true;
      gtk.enable = true;
      hyprland.enable = true;
      hyprland.hyprpaper.enable = true;
      firefox.enable = true;
      fzf.enable = true;
      lazygit.enable = true;
      nushell.enable = true;
      fish.enable = true;
      vesktop.enable = true;
      vscode.enable = false;
      wezterm.enable = true;
      kitty.enable = true;
    };
    opacity.terminal = 0.8;
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.space-mono;
        name = "SpaceMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.space-mono;
        name = "SpaceMono Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
