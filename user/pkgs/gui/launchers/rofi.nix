{
  programs.rofi = {
    enable = true;

    font = "Iosevka Nerd Font 10";

    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "";
      drun-display-format = "{name}";
    };

    # Inline theme definition
    theme = {
      "*" = {
        font = "Iosevka Nerd Font 10";
        background = "#1E1D2FFF";
        background-alt = "#282839FF";
        foreground = "#D9E0EEFF";
        selected = "#7AA2F7FF";
        active = "#ABE9B3FF";
        urgent = "#F28FADFF";
      };

      "window" = {
        transparency = "real";
        location = "center";
        anchor = "center";
        fullscreen = true;
        width = 1366;
        height = 768;
        x-offset = 0;
        y-offset = 0;
        enabled = true;
        margin = 0;
        padding = 0;
        border = "0px solid";
        border-radius = "0px";
        border-color = "@selected";
        background-color = "black / 20%";
        cursor = "default";
      };

      "mainbox" = {
        enabled = true;
        spacing = "100px";
        margin = "0px";
        padding = "100px 225px";
        border = "0px solid";
        border-radius = "0px";
        border-color = "@selected";
        background-color = "transparent";
        children = ["inputbar" "listview"];
      };

      "inputbar" = {
        enabled = true;
        spacing = "10px";
        margin = "0% 25%";
        padding = "18px";
        border = "0px solid";
        border-radius = "10px";
        border-color = "@selected";
        background-color = "white / 5%";
        text-color = "@foreground";
        children = ["prompt" "entry"];
      };

      "prompt" = {
        enabled = true;
        background-color = "transparent";
        text-color = "inherit";
      };

      "textbox-prompt-colon" = {
        enabled = true;
        expand = false;
        str = ":";
        background-color = "transparent";
        text-color = "inherit";
      };

      "entry" = {
        enabled = true;
        background-color = "transparent";
        text-color = "inherit";
        cursor = "text";
        placeholder = "Search";
        placeholder-color = "inherit";
      };

      "listview" = {
        enabled = true;
        columns = 8;
        lines = 4;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = "0px";
        margin = "0px";
        padding = "0px";
        border = "0px solid";
        border-radius = "0px";
        border-color = "@selected";
        background-color = "transparent";
        text-color = "@foreground";
        cursor = "default";
      };

      "scrollbar" = {
        handle-width = "5px";
        handle-color = "@selected";
        border-radius = "0px";
        background-color = "@background-alt";
      };

      "element" = {
        enabled = true;
        spacing = "15px";
        margin = "0px";
        padding = "35px 10px";
        border = "0px solid";
        border-radius = "15px";
        border-color = "@selected";
        background-color = "transparent";
        text-color = "@foreground";
        orientation = "vertical";
        cursor = "pointer";
      };

      "element normal.normal" = {
        background-color = "transparent";
        text-color = "@foreground";
      };

      "element selected.normal" = {
        background-color = "white / 5%";
        text-color = "@foreground";
      };

      "element-icon" = {
        background-color = "transparent";
        text-color = "inherit";
        size = "72px";
        cursor = "inherit";
      };

      "element-text" = {
        background-color = "transparent";
        text-color = "inherit";
        highlight = "inherit";
        cursor = "inherit";
        vertical-align = "0.5";
        horizontal-align = "0.5";
      };

      "error-message" = {
        padding = "100px";
        border = "0px solid";
        border-radius = "0px";
        border-color = "@selected";
        background-color = "black / 10%";
        text-color = "@foreground";
      };

      "textbox" = {
        background-color = "transparent";
        text-color = "@foreground";
        vertical-align = "0.5";
        horizontal-align = "0.0";
        highlight = "none";
      };
    };
  };
}
