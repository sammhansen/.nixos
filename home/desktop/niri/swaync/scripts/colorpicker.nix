let
  script = ''
    #!/usr/bin/env bash

    out="$(niri msg pick-color)"

    rgb=$(echo "$out" | grep -o 'rgb([^)]*)')
    hex=$(echo "$out" | grep -o '#[0-9a-fA-F]*')

    echo "$rgb" | wl-copy
    echo "$hex" | wl-copy
  '';
in {
  xdg.configFile."swaync/scripts/colorpicker.sh" = {
    executable = true;
    text = script;
  };
}
