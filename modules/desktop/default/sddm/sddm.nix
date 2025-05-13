{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.dm;
in {
  config = mkIf (cfg == "sddm") {
    services = {
      displayManager = {
        sessionPackages = [
          pkgs.river
        ];
        sddm = {
          enable = true;
          # package = pkgs.kdePackages.sddm;
          theme = lib.mkForce "${import ./theme.nix {inherit pkgs;}}";
        };
      };
    };

    environment.systemPackages = with pkgs;
    with libsForQt5; [
      qt5.qtquickcontrols2
      qt5.qtgraphicaleffects
    ];
  };
}
