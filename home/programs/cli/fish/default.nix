{
  programs = {
    fish = {
      enable = true;
      plugins = [];
      shellInit = ''
        function fish_greeting; end
      '';
    };
  };
}
