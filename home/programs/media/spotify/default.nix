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
      shuffle
      trashbin
      popupLyrics
      bestMoment
      wikify
    ];

    theme = spicePkgs.themes.orchis;
    colorScheme = "custom";
    customColorScheme = {
      "text" = stripHash colors.on_surface;
      "subtext" = stripHash colors.on_surface_variant;
      "nav-active-text" = stripHash colors.surface;
      "main" = stripHash colors.background;
      "sidebar" = stripHash colors.surface_container;
      "player" = stripHash colors.primary;
      "card" = stripHash colors.surface;
      "shadow" = stripHash colors.shadow;
      "main-secondary" = stripHash colors.secondary;
      "button" = stripHash colors.primary;
      "button-secondary" = stripHash colors.secondary;
      "button-active" = stripHash colors.primary;
      "button-disabled" = stripHash colors.outline_variant;
      "nav-active" = stripHash colors.surface_container_high;
      "play-button" = stripHash colors.primary_container;
      "tab-active" = stripHash colors.surface_container_high;
      "notification" = stripHash colors.surface_container_high;
      "notification-error" = stripHash colors.error;
      "playback-bar" = stripHash colors.primary_container;
      "misc" = stripHash colors.surface_variant;
    };
  };
}
