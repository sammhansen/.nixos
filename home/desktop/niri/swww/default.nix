{
  isServer,
  isNiri,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./waypaper.nix
    ./waytrogen.nix
  ];

  config = mkIf (!isServer && isNiri) {
    services.swww = {
      enable = true;
    };
    home.packages = with pkgs; [
      swww
    ];
  };
}
