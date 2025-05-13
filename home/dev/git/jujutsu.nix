{...}: {
  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Hansen";
        email = "samhansen.dev@gmail.com";
      };

      git.subprocess = true;

      ui = {
        default-command = "status";
      };

      template-aliases = {
        "format_short_signature(signature)" = "signature.email().local()";
      };
    };
  };
}
