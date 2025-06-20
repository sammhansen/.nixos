{
  bifrost,
  username,
  pkgs,
  ...
}: let
  name = "${bifrost.user.name}";
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
        "plugdev"
      ];
    };

    groups = {
      scanner = {};
      wireshark = {};
      dialout = {};
      plugdev = {};
    };

    defaultUserShell = pkgs.zsh;
  };

  environment.shells = with pkgs; [
    bash
    fish
    zsh
  ];
}
