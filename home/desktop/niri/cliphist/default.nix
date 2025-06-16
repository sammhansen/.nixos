{pkgs, ...}: {
  services.cliphist = {
    enable = true;
    allowImages = true;
    systemdTargets = [
      "graphical-session.target"
    ];
  };

  home.packages = with pkgs; [
    wl-clipboard-rs
  ];
}
