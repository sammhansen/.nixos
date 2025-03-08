{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      # dart
      flutter
    ];

    sessionVariables = {
      CHROME_EXECUTABLE = pkgs.google-chrome;
    };
  };
}
