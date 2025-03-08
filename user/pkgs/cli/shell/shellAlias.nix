let
  nixprofile_path = "/nix/var/nix/profiles/system";
in {
  home.shellAliases = {
    x = "clear";
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
    kali = "distrobox enter kalignome -- /snap/bin/nu";
    dbinit = "distrobox create --name atlantis -i docker.io/kalilinux/kali-rolling:latest --init";

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
  };
}
