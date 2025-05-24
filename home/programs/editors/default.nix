{pkgs, ...}: {
  imports = [
    ./neovim
    ./helix
    ./zed
    ./vscode
  ];

  home.packages = with pkgs; [
    android-studio
  ];
}
