{bifrost, ...}: let
  nixprofile_path = "/nix/var/nix/profiles/system";
  username = bifrost.userconf.username;
  kali-host = bifrost.virtualisation.distrobox.kali.hostname;
in {
  home.shellAliases = {
    x = "clear";
    space = "du -sh * | sort -h";
    cat = "bat";
    q = "exit";
    ":q" = "exit";
    la = "ls -la";
    l = "ls";
    pk = "pkill";
    "tk" = "tmux kill-server";

    lf = "yazi";

    lg = "lazygit";
    v = "nvim";

    "xcb" = "export QT_QPA_PLATFORM=xcb";

    db = "distrobox";
    kali = "distrobox enter ${kali-host} -- /usr/bin/fish";
    dbinit = "distrobox create --name ${kali-host} -i docker.io/kalilinux/kali-rolling:latest --home /home/${username}/distrobox/kali --init";

    "gs" = "git status";
    "gd" = "git diff";
    "gdd" = "bash -c 'git diff \"$@\" | delta' _";
    "gb" = "git branch";
    "gch" = "git checkout";
    "gcl" = "git clone";
    "gc" = "git commit";
    "ga" = "git add";
    "gp" = "git push";
    "gpm" = "git push -u origin main";
    "gr" = "git reset --soft HEAD~1";

    "del" = "gio trash";
    "dev" = "nix develop -c nvim";
    "nd" = "nix develop";
    "nsh" = "nix-shell shell.nix";

    "ns" = "sudo nixos-rebuild switch --flake .#atlantis";
    nixos-gens = "sudo nix-env --list-generations --profile ${nixprofile_path}";
    nixos-gens-rm = "sudo nix-env --profile ${nixprofile_path} --delete-generations";

    "rb" = "systemctl reboot";
    "sdn" = "shutdown now";

    font-list = "fc-list : family | fzf | tr -d '\\n'";
    "mkdir" = "mkdir -pv";

    #sessions
    "slock" = "loginctl lock-session";
    "slogout" = "hyprctl dispatch exit";
    "ssleep" = "loginctl suspend";
    "shibernate" = "loginctl hibernate";
    "spoweroff" = "systemctl poweroff";
    "sreboot" = "systemctl reboot";
  };
}
