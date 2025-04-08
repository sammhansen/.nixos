{config, ...}: {
  nix = {
    # we can disable channels since we can just use the flake
    channel.enable = true;

    # we need to have nixpkgs in our path
    nixPath = ["nixpkgs=${config.nix.registry.nixpkgs.to.path}"];

    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      # more logging is nice when doing installs, we want to know if something goes wrong
      log-lines = 50;

      # A unimportant warning in this case
      warn-dirty = false;

      # Its nice to have more http downloads when setting up
      http-connections = 50;

      auto-optimise-store = true;

      # fetch from a cache if we can
      substituters = [
        "https://hyprland.cachix.org"
        "https://wezterm.cachix.org"
        "https://nix-community.cachix.org"
        "https://walker.cachix.org"
        "https://walker-git.cachix.org"
      ];

      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "wezterm.cachix.org-1:kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # for electron app to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
