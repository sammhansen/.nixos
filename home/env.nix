{
  lib,
  isServer,
  isWayland,
  ...
}: let
  inherit (lib) mkIf mkMerge;
in {
  config = mkMerge [
    (
      mkIf isWayland {
        home.sessionVariables = {
          NIXOS_OZONE_WL = 1;
        };
      }
    )

    (mkIf (!isServer) {
      home.sessionVariables = {
        TERMINAL = "foot";
        XTERM = "foot";
      };
    })

    {
      home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        NIXPKGS_ALLOW_UNFREE = "1";
        NIXPKGS_ALLOW_INSECURE = "1";
      };
    }
  ];
}
