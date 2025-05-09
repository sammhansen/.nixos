{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf bifrost.extra.flatpak.enable {
    services.flatpak = {
      enable = true;

      /*
        systemd.services.flatpak-repo = {
        path = [ pkgs.flatpak ];
        script = ''
          flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
      };
      */
    };
    environment.systemPackages = with pkgs; [
      steam-devices-udev-rules
    ];
  };
}
