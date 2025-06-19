{
  isServer,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.programs.browsers.firefox;
in {
  config = mkIf (!isServer && cfg.enable) {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-bin;
      profiles.default = {
        isDefault = true;
      };
    };

    home.packages = with pkgs; [
      uget
      uget-integrator
    ];
  };
}
