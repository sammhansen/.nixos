{
  inputs,
  pkgs,
  ...
}: let
  colors = import ../../../../.local/state/matugen/colors.nix;

  stripHash = hex: builtins.substring 1 (builtins.stringLength hex) hex;

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
      trashbin
      popupLyrics
    ];

    theme = spicePkgs.themes.dribbblish;
    colorScheme = "custom";
    customColorScheme = {
      "text" = stripHash colors.on_surface; # Text
      "subtext" = stripHash colors.on_surface_variant; # Subtext1
      "sidebar-text" = stripHash colors.on_surface; # Text
      "main" = stripHash colors.background; # Base
      "sidebar" = stripHash colors.surface_container; # Mantle
      "player" = stripHash colors.surface; # Base
      "card" = stripHash colors.surface; # Base
      "shadow" = stripHash colors.shadow; # Mantle
      "selected-row" = stripHash colors.secondary; # Overlay2
      "button" = stripHash colors.outline; # Overlay1
      "button-active" = stripHash colors.primary; # Overlay2
      "button-disabled" = stripHash colors.outline_variant; # Overlay0
      "tab-active" = stripHash colors.surface_container_high; # Surface0
      "notification" = stripHash colors.surface_container_high; # Surface0
      "notification-error" = stripHash colors.error; # Red
      "misc" = stripHash colors.surface_variant; # Surface1
    };
  };
}
