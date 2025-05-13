{...}: {
  services = {
    smartd = {
      enable = false;
      autodetect = true;
    };

    gvfs.enable = true;
    tumbler.enable = true;

    udev.enable = true;
    envfs.enable = true;
    dbus.enable = true;

    rpcbind.enable = false;
    nfs.server.enable = false;

    openssh.enable = false;

    fwupd.enable = true;

    gnome.gnome-keyring.enable = true;
  };
}
