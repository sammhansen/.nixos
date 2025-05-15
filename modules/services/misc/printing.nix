{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf bifrost.extra.printing.enable {
    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [
          gutenprint
          hplipWithPlugin
        ];
      };

      # required for network discovery of printers
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
