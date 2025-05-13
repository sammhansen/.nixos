{pkgs, ...}: {
  systemd.user.services.hyprsunset = {
    Unit = {
      Description = "Hyprsunset autostart";
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.hyprsunset}/bin/hyprsunset";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };
  home.packages = with pkgs; [
    hyprsunset
  ];
}
