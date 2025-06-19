{
  isServer,
  isNiri,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  script = ''
    #!/usr/bin/env bash

    out="$(niri msg pick-color)"

    rgb=$(echo "$out" | grep -o 'rgb([^)]*)')
    hex=$(echo "$out" | grep -o '#[0-9a-fA-F]*')

    echo "$rgb" | wl-copy
    echo "$hex" | wl-copy
  '';
in {
  config = mkIf (!isServer && isNiri) {
    xdg.configFile."swaync/scripts/colorpicker.sh" = {
      text = script;
      executable = true;
    };
  };
}
