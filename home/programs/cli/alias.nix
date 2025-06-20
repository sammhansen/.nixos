{
  bifrost,
  username,
  ...
}: let
  nixprofile_path = "/nix/var/nix/profiles/system";
  flakeDir = bifrost.device.flakeDir;
  kali-hostname = "kali";
in {
  home.shellAliases = {
    x = "clear";
    space = "du -sh * | sort -h";
    car = "bat";
    q = "exit";
    ":q" = "exit";
    la = "ls -la";
    l = "ls";
    pk = "pkill";
    tk = "tmux kill-server";
    zk = "zellij kill-session";
    zka = "zellij kill-all-sessions";
    zrf = "zellij run --floating --";

    lg = "lazygit";
    dg = "gh dash";
    v = "nvim";

    xcb = "export QT_QPA_PLATFORM=xcb";

    db = "distrobox";
    kali = "distrobox enter ${kali-hostname} -- /usr/bin/fish";
    dbinit = "distrobox create --name ${kali-hostname} -i docker.io/kalilinux/kali-rolling:latest --home /home/${username}/distrobox/kali";

    gs = "git status";
    gd = "git diff";
    gdd = "bash -c 'git diff \"$@\" | delta' _";
    gb = "git branch";
    gch = "git checkout";
    gcl = "git clone";
    gc = "git commit";
    ga = "git add";
    gp = "git push";
    gpm = "git push -u origin main";
    gr = "git reset --soft HEAD~1";

    dev = "nix develop -c nvim";
    nd = "nix develop -c zsh";
    ns = "nix-shell -c zsh";

    nrf = "sudo nixos-rebuild switch --flake ${flakeDir}/#hell; swaync-client -R; swaync-client -rs";
    nixos-gens = "sudo nix-env --list-generations --profile ${nixprofile_path}";
    nixos-gens-rm = "sudo nix-env --profile ${nixprofile_path} --delete-generations";
    nixos-boot-clean = "sudo /run/current-system/bin/switch-to-configuration boot";

    mkdir = "mkdir -pv";
  };
}
