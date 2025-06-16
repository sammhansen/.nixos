{
  imports = [
    ./gh.nix
    ./lazygit.nix
    ./gh-dash.nix
  ];

  programs.git = {
    enable = true;
    userName = "Hansen";
    userEmail = "sa" + "mh" + "an" + " sen" + "." + "dev" + "@" + "gma" + "il" + "." + "c" + "om";
    delta = {
      enable = true;

      options = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };
    };

    extraConfig = {
      init.defaultBranch = "main";
      repack.usedeltabaseoffset = "true";
      color.ui = "auto";
      diff.algorithm = "histogram";
      help.autocorrect = 10;

      core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";

      branch = {
        autosetupmerge = "true";
        sort = "committerdate";
      };

      commit.verbose = true;
      fetch.prune = false;
      pull.ff = "only";

      push = {
        default = "current";
        autoSetupRemote = true;
      };
      merge = {
        stat = "true";
        conflictstyle = "zdiff3";
        tool = "meld";
      };

      rebase = {
        updateRefs = true;
        autoSquash = true;
        autoStash = true;
      };
      rerere = {
        enabled = true;
        autoupdate = true;
      };
      diff.mnemonicprefix = true;
      transfer.fsckObjects = true;
      fetch.fsckObjects = true;
      receive.fsckObjects = true;
    };

    aliases = {
      st = "status";
      br = "branch";
      c = "commit -m";
      ca = "commit -am";
      co = "checkout";
      d = "diff";
      df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}";
      fuck = "commit --amend -m";
      graph = "log --all --decorate --graph";
      ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
      pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
      af = "!git add $(git ls-files -m -o --exclude-standard | fzf -m)";
      hist = ''
        log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all
      '';
      llog = ''
        log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative
      '';
      # https://github.com/arichtman/nix/blob/18f5613c2842e12e49350aeceace63863ad59244/modules/home/default-home/default.nix#L11
      fuggit = "!git add . && git commit --amend --no-edit && git push --force";
      # thanks @vbde for this
      idc = "!git commit -am '$(curl -s https://whatthecommit.com/index.txt)'";
    };

    ignores = [
      # system residue
      ".cache/"
      ".DS_Store"
      ".Trashes"
      ".Trash-*"
      "*.bak"
      "*.swp"
      "*.swo"
      "*.elc"
      ".~lock*"

      # build residue
      "tmp/"
      "target/"
      "result"
      "result-*"
      "*.exe"
      "*.exe~"
      "*.dll"
      "*.so"
      "*.dylib"

      # ide residue
      ".idea/"
      ".vscode/"

      # dependencies
      ".direnv/"
      "node_modules"
      "vendor"
    ];
  };
}
