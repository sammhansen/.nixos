{ pkgs, ... }:
{
	 # Accepting licenses and allowing unfree packages
  nixpkgs.config = {
    android_sdk.accept_license = true;
  };

  # Adding androidenv setup to system packages
  environment.systemPackages = with pkgs; [
    (androidenv.emulateApp {
      name = "emulate-MyAndroidApp";
      platformVersion = "30";
      abiVersion = "x86_64"; # armeabi-v7a, mips, x86_64
      systemImageType = "google_apis_playstore";
    })
		libGL
		glibc
  ];
}
