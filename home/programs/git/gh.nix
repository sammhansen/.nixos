{pkgs, ...}: {
  programs.gh = {
    enable = true;

    extensions = builtins.attrValues {
      inherit
        (pkgs)
        gh-copilot
        gh-eco
        ;
    };

    settings = {
      git_protocol = "ssh";
      prompt = "enabled";
    };
  };
}
