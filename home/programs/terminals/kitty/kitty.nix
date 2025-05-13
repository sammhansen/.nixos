{
  bifrost,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = bifrost.terminals.kitty;
in {
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font.name = "Iosevka Nerd Font";
      extraConfig = builtins.readFile ./kitty.conf;
    };
  };
}
