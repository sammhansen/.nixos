{
  lib,
  ... 
}:
{
	programs.foot = {
		enable = true;
		settings = {
			main = {
				shell = "tmux";
        font = lib.mkForce "SpaceMono Nerd Font:size=12.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga,termicons:size=12";
        line-height = 13.5;
				letter-spacing = 0;
        term = "xterm-256color";
        selection-target = "clipboard";
        dpi-aware = "no";
        pad = "12x12 center";
      };
      cursor = {
        style = "beam";
        blink = "yes";
      };
      desktop-notifications = {
        command = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
      };

      bell = {
        command = "notify-send bell";
        command-focused = "no";
        notify = "yes";
        urgent = "yes";
      };
			
			colors = {
				alpha = lib.mkForce 0.7;
			};

			key-bindings = {
				clipboard-copy = "Control+c";
				clipboard-paste= "Control+v";
				search-start = "Control+f";
			};

			search-bindings = {
				cancel= "Escape";
				find-prev= "Shift+F3";
				find-next= "F3 Control+G";
			};
		};
	};
}
