{ ... }:
{
	programs = {
		command-not-found = {
			enable = true;
			# enableFishIntegration = true;
		};

		nix-index = {
		  enable = false;
		  # enableFishIntegration = true;
		};
	};
}
