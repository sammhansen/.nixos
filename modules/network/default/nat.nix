{...}: {
  networking = {
    nat = {
      enable = true;

      # internalInterfaces = ["waydroid0" "docker0"];
      internalInterfaces = ["docker0" "virbr0"];
      externalInterface = "wlp4s0";

      internalIPs = ["192.168.240.0/24"];
    };
  };
}
