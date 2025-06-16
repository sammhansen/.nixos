{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    mutableExtensionsDir = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          github.copilot
          github.copilot-chat
          github.vscode-pull-request-github
          github.vscode-github-actions
          eamodio.gitlens

          ms-vscode-remote.remote-ssh
          esbenp.prettier-vscode
          ms-vscode.live-server
          vscodevim.vim
          wakatime.vscode-wakatime
          formulahendry.code-runner
          leonardssh.vscord

          dart-code.dart-code
          dart-code.flutter

          ms-python.python
          ms-python.debugpy

          jnoortheen.nix-ide
          kamadorueda.alejandra
        ];
      };
    };
  };
}
