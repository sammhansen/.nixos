{
  bifrost,
  pkgs,
  ...
}: let
  wallpaper = bifrost.themes.wallpaper;
in {
  imports = [
    ./waypaper.nix
  ];
  home.packages = with pkgs; [
    swaybg
  ];
  systemd.user.services.swaybg = {
    Unit = {
      Description = "swaybg background service";
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg -i ${wallpaper} -m fill";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
