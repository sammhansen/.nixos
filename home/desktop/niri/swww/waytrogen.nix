{
  isServer,
  isNiri,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (!isServer && isNiri) {
    home.packages = with pkgs; [
      waytrogen
    ];
  };
}
