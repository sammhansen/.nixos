{
  services.wlsunset = {
    enable = true;
    gamma = 0.9;
    temperature = {
      day = 6500;
      night = 4000;
    };
    sunrise = "06:30";
    sunset = "19:00";
    systemdTarget = "graphical-session.target";
  };
}
