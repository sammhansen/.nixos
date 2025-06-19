{
  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
}
