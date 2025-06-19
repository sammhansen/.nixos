{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  configuration = ../../../../.config/nvim;
  cfg = config.bifrost.programs.editors.neovim;
in {
  config = mkIf (cfg.enable) {
    programs.neovim = {
      enable = true;
      package = pkgs.neovim-unwrapped;
      defaultEditor = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;

      extraPackages = with pkgs; [
        # snacks.image
        imagemagick # required to render images
        mermaid-cli
        tectonic
        ghostscript_headless

        gnumake
        fd

        alejandra
        black
        golangci-lint
        gopls
        gotools
        hadolint
        isort
        lua-language-server
        markdownlint-cli
        nixd
        clang-tools
        emmet-language-server

        prettierd
        nodePackages.bash-language-server
        nodePackages.prettier
        nodePackages.typescript
        nodePackages.typescript-language-server
        pyright
        ruff
        shellcheck
        shfmt
        stylua
        terraform-ls
        tflint
        vscode-langservers-extracted
        yaml-language-server
      ];
    };

    xdg.configFile."nvim" = {
      source = "${configuration}";
      recursive = true;
    };
  };
}
