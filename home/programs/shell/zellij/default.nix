{...}: {
  programs.zellij = {
    enable = false;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    settings = {
      default_shell = "fish";
      layout = "compact";
      ui.pane_frames.hide_session_name = true;
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        pane borderless=true
        pane size=1 borderless=true {
            plugin location="zellij:tab-bar"
        }
    }
  '';
}
