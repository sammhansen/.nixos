{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    clang
    cmake
    gnumake
    gcc

    gradle
    android-tools
    android-studio-tools

    yarn
  ];
}
