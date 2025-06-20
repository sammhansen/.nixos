{
  lib,
  pkgs,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer && isWayland) {
    home.packages = with pkgs; [
      waytrogen
    ];
  };
}
