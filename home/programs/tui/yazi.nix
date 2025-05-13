{...}: {
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = false;
    enableNushellIntegration = true;
  };
}
