{
  imports = [
    # ./printing
    ./openssh
    ./keyring
    ./libinput

    # ./httpd
    # ./nginx
  ];

  services = {
    smartd = {
      enable = false;
      autodetect = true;
    };
    gvfs.enable = true;
    tumbler.enable = true;
    udev.enable = true;
    dbus.enable = true;
    rpcbind.enable = false;
    nfs.server.enable = false;
    fwupd.enable = true;
    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };
}
