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
      auto-optimise-store = true;
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
