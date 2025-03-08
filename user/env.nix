{...}: {
  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = "1";
    NIXPKGS_ALLOW_INSECURE = "1";
    NIXOS_OZONE_WL = "1"; # for electron apps to use wayland
    TERMINAL = "kitty";
    VISUAL = "nvim";
  };
}
