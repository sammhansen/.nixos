{pkgs, ...}: {
  imports = [
    ./neovim
    ./zed
    ./vscode

    ./onlyoffice
    ./obsidian
  ];

  home.packages = with pkgs; [
    android-studio
  ];
}
