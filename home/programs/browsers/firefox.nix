{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.browsers.firefox;
in {
  config = mkIf cfg.enable {
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
