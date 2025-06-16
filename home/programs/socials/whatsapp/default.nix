{pkgs, ...}: {
  systemd.user.services.whatsapp = {
    Unit = {
      Description = "A whatsapp client";
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.zapzap}/bin/zapzap";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
