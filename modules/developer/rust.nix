{
  pkgs,
  lib,
  bifrost,
  isServer,
  ...
}: let
  cfg = bifrost.dev.rust;
in {
  config = lib.mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      rustc
      rustup
      cargo-edit
      cargo-watch
      cargo-outdated
      cargo-audit
      clippy
      rust-analyzer
    ];

    environment.variables = {
      PATH = [
        "${pkgs.rustc}/bin"
        "${pkgs.cargo}/bin"
      ];
    };
  };
}
