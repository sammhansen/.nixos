{
  containers.webserver = {
    autoStart = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    hostAddress6 = "fc00::1";
    localAddress6 = "fc00::2";
    config = {
      config,
      pkgs,
      lib,
      ...
    }: {
      services.httpd = {
        enable = true;
        package = pkgs.apacheHttpd;
        adminAddr = "admin@example.org";
      };

      networking = {
        firewall.allowedTCPPorts = [80];

        useHostResolvConf = lib.mkForce false;
      };

      services.resolved.enable = true;

      system.stateVersion = "24.11";
    };
  };
}
