{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      plugins = [];
      shellInit = ''
        function fish_greeting; end
      '';
    };
  };

  home.packages = with pkgs; [
    sqlite
  ];
}
