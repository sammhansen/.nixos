{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  cfg = bifrost.dev.dotnet;
in {
  config = lib.mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      dotnet-sdk_8
      dotnetPackages.Nuget
    ];
  };
}
