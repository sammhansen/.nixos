{lib, ...}: let
  inherit (lib.strings) concatStrings;

  colors = import ../../../.local/state/matugen/colors.nix;

  # TODO: come back and change this a bit
  ss = symbol: style: {
    inherit symbol;
    format = "[$symbol ](${style})";
  };
  ssv = symbol: style: {
    inherit symbol;
    format = "via [$symbol](${style})";
  };
in {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;

    settings = {
      add_newline = true;
      format = concatStrings [
        "$container $os $hostname $username $directory\n"
        "$character"
      ];

      container = {
        symbol = " 󰏖";
        style = "bg:default fg:yellow dimmed";
        format = "[$symbol \[$name\]]($style)";
      };

      hostname = {
        ssh_only = true;
        format = "[•$hostname](bg:default fg:${colors.on_secondary_container})";
        trim_at = ".companyname.com";
        disabled = false;
      };

      character = {
        success_symbol = "[  ](bold fg:${colors.primary})";
        error_symbol = "[ 󰅙 ](bold fg:${colors.error})";
      };

      username = {
        style_user = "bg:default fg:${colors.primary}";
        style_root = "bg:default fg:${colors.error}";
        format = "[   $user]($style) ";
        show_always = true;
      };

      directory = {
        home_symbol = "  ";
        read_only = "  ";
        style = "bg:default fg:default";
        truncation_length = 6;
        truncation_symbol = "••/";
        format = "([ @ ](bg:default fg:${colors.error_container}) [$path ]($style))";

        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
          "GitHub" = "";
        };
      };

      os = {
        style = "bold white";
        format = "[$symbol]($style)";

        symbols = {
          Arch = "";
          Artix = "";
          Debian = "";
          Kali = "󰠥";
          EndeavourOS = "";
          Fedora = "";
          NixOS = "";
          openSUSE = "";
          SUSE = "";
          Ubuntu = "";
          Raspbian = "";
          #elementary = "";
          #Coreos = "";
          Gentoo = "";
          #mageia = ""
          CentOS = "";
          #sabayon = "";
          #slackware = "";
          Mint = "";
          Alpine = "";
          #aosc = "";
          #devuan = "";
          Manjaro = "";
          #rhel = "";
          Macos = "󰀵";
          Linux = "";
          Windows = "";
        };
      };

      # container = ss " 󰏖" "yellow dimmed";
      python = ss "" "yellow";
      nodejs = ss " " "yellow";
      lua = ss "󰢱 " "blue";
      rust = ss "" "red";
      java = ss " " "red";
      c = ss " " "blue";
      golang = ss "" "blue";
      docker_context = ss " " "blue";

      nix_shell = ssv " " "blue";

      # git_branch = {
      #   symbol = "󰘬";
      #   format = "[[   on](fg:white) $symbol $branch ](fg:purple)(:$remote_branch)";
      #   truncation_length = 4;
      #   truncation_symbol = "…/";
      #   style = "bold green";
      # };
      # git_status = {
      #   format = "[$all_status$ahead_behind]($style) ";
      #   style = "bold green";
      #   conflicted = "🏳";
      #   up_to_date = " ";
      #   untracked = " ";
      #   ahead = "⇡\${count}";
      #   diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
      #   behind = "⇣\${count}";
      #   stashed = "󰏗 ";
      #   modified = " ";
      #   staged = "[++\\($count\\)](green)";
      #   renamed = "󰖷 ";
      #   deleted = " ";
      # };
      #
      battery.disabled = true;
    };
  };
}
