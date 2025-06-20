{
  programs.eza = {
    enable = true;
    icons = "auto";

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    extraOptions = [
      "--group"
      "--group-directories-first"
      "--header"
      "--no-permissions"
      "--octal-permissions"
    ];
  };
}
