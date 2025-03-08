{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      # THEMEING
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons

      # GIT
      github.copilot
      github.copilot-chat
      github.vscode-pull-request-github
      github.vscode-github-actions
      eamodio.gitlens

      # UTILITIES
      ms-vscode-remote.remote-ssh
      esbenp.prettier-vscode
      ms-vscode.live-server
      vscodevim.vim # yes i hate myself
      wakatime.vscode-wakatime
      formulahendry.code-runner
      leonardssh.vscord

      # flutter
      dart-code.dart-code
      dart-code.flutter

      #python
      ms-python.python
      ms-python.debugpy

      # LANGUAGES BASED EXTENSIONS
      ## NIX
      jnoortheen.nix-ide
      kamadorueda.alejandra
    ];
  };
}
