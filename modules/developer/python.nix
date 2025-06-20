{
  lib,
  pkgs,
  bifrost,
  isServer,
  ...
}: let
  cfg = bifrost.dev.python;
in {
  config = lib.mkIf (!isServer && cfg.enable) {
    environment.systemPackages = with pkgs; [
      (python311.withPackages (ps:
        with ps; [
          i3ipc
          requests
          ipython
          six
          psutil
          pynvml
          pyqtgraph
          pyqt6
          pyyaml
          pillow
          jedi
          libcst
          wheel
          jupyterlab
          datasets
          debugpy
        ]))
      isort
      uv
      python311
      ruff
    ];
  };
}
