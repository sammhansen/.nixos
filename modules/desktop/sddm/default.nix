{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkForce;
  cfg = bifrost.sessions.dm;
  theme = pkgs.fetchFromGitHub {
    owner = "sammhansen";
    repo = "nix-sddm";
    rev = "686fcd335fada39e5ffbed3ade289f304ddf1b31";
    sha256 = "01zbv98l5qcksifp13jccfinlrb3fch6n5dmbaafgi4s7d1ali9z";
  };
in {
  config = mkIf (cfg == "sddm") {
    services = {
      displayManager = {
        sessionPackages = [
        ];
        sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };
          theme = mkForce "${theme}";
          extraPackages = with pkgs.kdePackages; [
            qtsvg
            qtmultimedia
            qtvirtualkeyboard
          ];
        };
      };
    };
  };
}
