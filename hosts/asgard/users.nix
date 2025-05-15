{
  bifrost,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  username = "${bifrost.userconf.username}";
  name = "${bifrost.userconf.name}";
in {
  users = {
    users."${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${name}";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "scanner"
        "lp"
        "video"
        "input"
        "audio"
        "docker"
        "wireshark"
        "dialout"
        "fingerprint"
        "plugdev"
        "ydotool" #require for hints
      ];
    };

    # create groups that arent created
    groups = {
      scanner = {};
      libvirtd = {};
      wireshark = {};
      dialout = {};
      fingerprint = {};
      plugdev = {};
      ydotool = {};
    };

    defaultUserShell = pkgs.bash;
  };

  environment.shells = with pkgs; [
    bash
    fish
    zsh
    nushell
  ];

  programs.fish = mkIf bifrost.shells.fish.enable {
    enable = true;
  };
}
