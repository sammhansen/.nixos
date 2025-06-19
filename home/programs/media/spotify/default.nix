{
  inputs,
  config,
  lib,
  pkgs,
  isServer,
  colors,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.programs.media.spotify;

  stripHash = hex: builtins.substring 1 (builtins.stringLength hex) hex;

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  config = mkIf (!isServer && cfg.enable) {
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
      ];

      # theme = spicePkgs.themes.orchis;
      # colorScheme = "custom";
      # customColorScheme = {
      #   "text" = stripHash colors.on_surface.hex;
      #   "subtext" = stripHash colors.on_surface_variant.hex;
      #   "nav-active-text" = stripHash colors.surface.hex;
      #   "main" = stripHash colors.background.hex;
      #   "sidebar" = stripHash colors.surface_container.hex;
      #   "player" = stripHash colors.primary.hex;
      #   "card" = stripHash colors.surface.hex;
      #   "shadow" = stripHash colors.shadow.hex;
      #   "main-secondary" = stripHash colors.secondary.hex;
      #   "button" = stripHash colors.primary.hex;
      #   "button-secondary" = stripHash colors.secondary.hex;
      #   "button-active" = stripHash colors.primary.hex;
      #   "button-disabled" = stripHash colors.outline_variant.hex;
      #   "nav-active" = stripHash colors.surface_container_high.hex;
      #   "play-button" = stripHash colors.primary_container.hex;
      #   "tab-active" = stripHash colors.surface_container_high.hex;
      #   "notification" = stripHash colors.surface_container_high.hex;
      #   "notification-error" = stripHash colors.error.hex;
      #   "playback-bar" = stripHash colors.primary_container.hex;
      #   "misc" = stripHash colors.surface_variant.hex;
      # };
    };
  };
}
