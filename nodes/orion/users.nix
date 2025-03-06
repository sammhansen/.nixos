{pkgs, ...}: let
  inherit (import ./variables.nix) gitUsername;
in {
  users = {
    users."lilith" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      shell = pkgs.zsh;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
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
        "kvm"
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

  programs.fish.enable = true;
}
