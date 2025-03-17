{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.sessions.dm;
in {
  config = mkIf (cfg == "tui-greet") {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd startx";
          user = "greeter";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      xorg.xinit
    ];
  };
}
