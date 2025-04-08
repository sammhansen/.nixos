{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # code-cursor
    # android-studio
    # jetbrains.pycharm-community
  ];
}
