# hosts/bree/system/audio.nix
{pkgs, ...}: {
  #===================================================================
  # AUDIO
  #===================================================================

  # Use PipeWire (modern audio system)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Laptop speaker enhancement - EQ filter chain
    extraConfig.pipewire."92-laptop-speaker-eq" = {
      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "Laptop Speaker Enhancement";
            "media.name" = "Laptop Speaker EQ";
            "filter.graph" = {
              nodes = [
                # PRE-AMP to prevent clipping
                {
                  type = "builtin";
                  name = "preamp";
                  label = "bq_highshelf";
                  control = {
                    "Freq" = 0.0; # 0Hz = pre-amp
                    "Q" = 1.0;
                    "Gain" = -6.0; # -6dB to compensate for EQ boosts
                  };
                }
                # Bass boost
                {
                  type = "builtin";
                  name = "bass_boost";
                  label = "bq_lowshelf";
                  control = {
                    "Freq" = 100.0; # 100Hz
                    "Q" = 0.7; # Standard Q for shelf filters
                    "Gain" = 4.0; # +4dB
                  };
                }
                # Mid-range clarity - vocal frequencies
                {
                  type = "builtin";
                  name = "mid_boost";
                  label = "bq_peaking";
                  control = {
                    "Freq" = 2000.0; # 2kHz (vocal range)
                    "Q" = 1.0;
                    "Gain" = 2.0; # +2dB mid boost
                  };
                }
                # Treble boost
                {
                  type = "builtin";
                  name = "treble_boost";
                  label = "bq_highshelf";
                  control = {
                    "Freq" = 10000.0;
                    "Q" = 0.7;
                    "Gain" = 3.0; # +3dB
                  };
                }
              ];
            };
            "audio.channels" = 2;
            "audio.position" = ["FL" "FR"];
            "capture.props" = {
              "node.name" = "laptop_speaker_eq";
              "media.class" = "Audio/Sink";
              "audio.channels" = 2;
              "audio.position" = ["FL" "FR"];
            };
            "playback.props" = {
              "node.name" = "laptop_speaker_eq_playback";
              "audio.channels" = 2;
              "audio.position" = ["FL" "FR"];
              "node.passive" = true;
            };
          };
        }
      ];
    };
  };

  # Disable PulseAudio (replaced by PipeWire)
  services.pulseaudio.enable = false;

  # Real-time audio priority
  security.rtkit.enable = true;

  # Audio firmware (REQUIRED for Intel UX5406SA)
  hardware.firmware = [pkgs.sof-firmware];
  hardware.enableRedistributableFirmware = true;
}
