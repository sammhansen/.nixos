{pkgs, ...}: {
  stylix = {
    enable = true;
    image = ../../../../../.config/wallpapers/bunny.png;
    base16Scheme = ./themes/catppuccin-mocha/catppuccin-mocha.yaml;
    polarity = "dark";
    opacity.terminal = 0.8;

    targets = {
      chromium.enable = true;
    };

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
