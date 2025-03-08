{ pkgs, ... }:
{
	programs.ghostty = {
		enable = true;

    settings = {
			command = "${pkgs.tmux}/bin/tmux";
			shell-integration = "zsh";

			font-family = "SpaceMono Nerd Font";
			theme = "dark:catppuccin-mocha,light:catppuccin-latte";
    	window-theme = "dark";

			background-opacity = 0.8;
      minimum-contrast = 1.1;

			mouse-hide-while-typing = true;
			mouse-scroll-multiplier = "2";

			desktop-notifications = true;
			confirm-close-surface = false;
			clipboard-read = "allow";
			clipboard-paste-protection = false;

			window-padding-balance = true;
			window-decoration = false;
			window-save-state = "always";
		};

		# keybinding = {
    	# keybind = global:ctrl+`=toggle_quick_terminal
    	# "global:ctrl+`" = "toggle_quick_terminal";
  	# };
	};
}
