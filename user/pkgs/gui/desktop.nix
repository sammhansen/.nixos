{...}: let
  config = ../../../.local/share/applications;
in {
  xdg.dataFile = {
    "applications" = {
      recursive = true;
      source = "${config}";
    };
  };
}
