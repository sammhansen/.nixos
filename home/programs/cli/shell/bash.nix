{...}: {
  programs.bash = {
    enableCompletion = true;

    historyFile = "~/.local/state/bash/history";
    historyFileSize = 1000;
    historySize = 100;
    shellOptions = [
      "cdspell"
      "checkjobs"
      "checkwinsize"
      "dirspell"
      "globstar"
      "histappend"
      "no_empty_cmd_completion"
    ];
  };
}
