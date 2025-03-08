{
  pkgs,
  config,
  lib,
  ...
}: let
  aliases = {
    "db" = "distrobox";
    "kali" = "distrobox enter kalignome -- /snap/bin/nu";
    "tree" = "eza --tree";
    "v" = "nvim";
    "cat" = "bat";
    "ns" = "sudo nixos-rebuild switch --flake .#nix";
    "hs" = "home-manager switch -b backup --flake .#asherah";

    "la" = "ls -la";
    "l" = "ls";

    ":q" = "exit";
    "q" = "exit";
    "x" = "clear";

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
  };
in {
  options.shellAliases = with lib;
    mkOption {
      type = types.attrsOf types.str;
      default = {};
    };

  config.programs.nushell = {
    shellAliases = aliases // config.shellAliases;
    enable = true;
    environmentVariables = {
      PROMPT_INDICATOR_VI_INSERT = "  ";
      PROMPT_INDICATOR_VI_NORMAL = "∙ ";
      PROMPT_COMMAND = "";
      PROMPT_COMMAND_RIGHT = "";
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      SHELL = "${pkgs.nushell}/bin/nu";
      EDITOR = config.home.sessionVariables.EDITOR;
      VISUAL = config.home.sessionVariables.VISUAL;
    };
    #configFile.source = ./../.config/nu/config.nu;

    extraConfig = let
      conf = builtins.toJSON {
        show_banner = false;
        edit_mode = "vi";

        ls.clickable_links = true;
        rm.always_trash = true;

        table = {
          mode = "rounded"; # compact thin rounded
          index_mode = "always"; # alway never auto
          header_on_separator = false;
        };

        cursor_shape = {
          vi_insert = "line";
          vi_normal = "block";
        };

        display_errors = {
          exit_code = false;
        };

        menus = [
          {
            name = "completion_menu";
            only_buffer_difference = false;
            marker = "? ";
            type = {
              layout = "columnar"; # list, description
              columns = 4;
              col_padding = 2;
            };
            style = {
              text = "magenta";
              selected_text = "blue_reverse";
              description_text = "yellow";
            };
          }
        ];

        keybindings = [
          {
            name = "fuzzy_history";
            modifier = "control";
            keycode = "char_r";
            mode = ["emacs" "vi_normal" "vi_insert"];
            event = [
              {
                send = "ExecuteHostCommand";
                cmd = "do {
                  $env.SHELL = '/usr/bin/bash'
                  commandline edit --insert (
                    history
                    | get command
                    | reverse
                    | uniq
                    | str join (char -i 0)
                    | fzf --scheme=history 
                    --read0
                    --layout=reverse
                    --height=40%
                    --bind 'ctrl-/:change-preview-window(right,70%|right)'
                    --preview='echo -n {} | nu --stdin -c \'nu-highlight\''
                    # Run without existing commandline query for now to test composability
                    # -q (commandline)
                    | decode utf-8
                    | str trim
                  )
                }";
              }
            ];
          }
        ];
      };
      completions = let
        completion = name: ''
          source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
        '';
      in
        names:
          builtins.foldl'
          (prev: str: "${prev}\n${str}") ""
          (map completion names);
    in ''
      $env.config = ${conf};
      ${completions ["cargo" "git" "nix" "npm" "curl"]}

      mkdir ($nu.data-dir | path join "vendor/autoload")

      # alias pueue = ${pkgs.pueue}/bin/pueue
      # alias pueued = ${pkgs.pueue}/bin/pueued
      # use ${pkgs.nu_scripts}/share/nu_scripts/modules/background_task/task.nu

      const path = "~/.nushellrc.nu"
      const null = "/dev/null"
      source (if ($path | path exists) {
          $path
      } else {
          $null
      })
    '';
  };
}
