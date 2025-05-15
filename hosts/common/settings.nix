{config, ...}: {
  nix = {
    channel.enable = true;
    nixPath = ["nixpkgs=${config.nix.registry.nixpkgs.to.path}"];
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      log-lines = 50;
      warn-dirty = false;
      http-connections = 50;

      auto-optimise-store = true;

      substituters = [
        # "https://hyprland.cachix.org"
        # "https://wezterm.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        # "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        # "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
