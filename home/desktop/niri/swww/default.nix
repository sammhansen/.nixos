{
  lib,
  pkgs,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  imports = [
    ./waypaper.nix
    ./waytrogen.nix
  ];

  config = mkIf (!isServer && isWayland) {
    services.swww = {
      enable = true;
    };
    home.packages = with pkgs; [
      swww
    ];
  };
}
