{...}: {
  networking = {
    nat = {
      enable = true;

      internalInterfaces = ["waydroid0" "docker0"];
      externalInterface = "wlp4s0";

      internalIPs = ["192.168.240.0/24"];
    };
  };
}
