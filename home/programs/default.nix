{pkgs, ...}: {
  imports = [
    ./bars
    ./launchers
    ./shell
    ./git
    ./editors
    ./browsers
    ./terminals
    ./media
    ./socials
    ./misc
  ];
  home.packages = with pkgs; [
    # moodle
    moodle-dl
    polypane
  ];
}
