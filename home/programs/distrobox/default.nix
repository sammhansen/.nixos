{
  config,
  lib,
  username,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.bifrost.virtualisation.distrobox;
in {
  config = mkIf cfg.enable {
    programs.distrobox = {
      enable = true;
      enableSystemdUnit = true;
      containers = {
        tamara = {
          image = "kalilinux/kali-rolling";
          entry = true;
          home = "/home/${username}/ctrs/kali";
          init = true;
          additional_packages = "git npm build-essential fish zsh neovim starship eza bat zoxide fzf seclists";
          init_hooks = [
            "ln -s /home/${username}/.local/state/nvim/colors.lua ~/.local/state/nvim/colors.lua"
          ];
        };
      };
    };
  };
}
