let
  output = ./output;
  input = ./input;
  irs = ./irs;

  build-in-audio = ''
    {
      "device": "alsa_output.pci-0000_00_1f.3.analog-stereo",
      "device-description": "Built-in Audio Analog Stereo",
      "device-profile": "analog-output-speaker",
      "enabled": false
    }
  '';
  oraimo-freepods-lite = ''
    {
      "device": "bluez_output.C1_69_B5_EB_21_8F.1",
      "device-description": "oraimo FreePods lite",
      "device-profile": "headset-output",
      "enabled": false
    }
  '';
  ailyons-ELP3701K = ''
    {
      "device": "bluez_output.41_42_42_60_87_56.1",
      "device-description": "AILYONS+ELP3701K",
      "device-profile": "headphone-output",
      "preset-name": "bass"
    }
  '';
in {
  xdg.configFile = {
    "easyeffects/input" = {
      recursive = true;
      source = "${input}";
    };

    "easyeffects/output" = {
      recursive = true;
      source = "${output}";
    };

    "easyeffects/irs" = {
      recursive = true;
      source = "${irs}";
    };

    "easyeffects/autoload/output/alsa_output.pci-0000_00_1f.3.analog-stereo:analog-output-speaker.json".text = build-in-audio;
    "easyeffects/autoload/output/bluez_output.C1_69_B5_EB_21_8F.1:headset-output.json".text = oraimo-freepods-lite;
    "easyeffects/autoload/output/bluez_output.41_42_42_60_87_56.1:headphone-output.json".text = ailyons-ELP3701K;
  };
}
