# hosts/bree/system/audio.nix
{pkgs, ...}: {
  #===================================================================
  # AUDIO
  #===================================================================

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    extraConfig.pipewire."92-laptop-speaker-eq" = {
      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "Laptop Speaker Enhancement";
            "media.name" = "Optimized Speaker EQ";
            "filter.graph" = {
              nodes = [
                {
                  type = "builtin";
                  name = "hpf";
                  label = "bq_highpass";
                  control = {
                    "Freq" = 130.0;
                    "Q" = 0.707;
                  };
                }
                {
                  type = "builtin";
                  name = "eq";
                  label = "param_eq";
                  config = {
                    filters = [
                      # Pre-amp: headroom for EQ boosts
                      {
                        type = "bq_highshelf";
                        freq = 0.0;
                        q = 1.0;
                        gain =
                          -4.0;
                      }
                      # Bass boost: Fletcher-Munson compensation
                      {
                        type = "bq_lowshelf";
                        freq = 150.0;
                        q = 0.7;
                        gain =
                          6.0;
                      }
                      # Lower midrange: body and warmth
                      {
                        type = "bq_peaking";
                        freq = 400.0;
                        q = 1.0;
                        gain =
                          2.0;
                      }
                      # Upper midrange: attack and punch (critical for small speakers)
                      {
                        type = "bq_peaking";
                        freq = 800.0;
                        q = 1.0;
                        gain =
                          4.0;
                      }
                      # Presence: vocal clarity and intelligibility
                      {
                        type = "bq_peaking";
                        freq = 3000.0;
                        q = 1.0;
                        gain =
                          3.0;
                      }
                      # Treble: air and detail
                      {
                        type = "bq_highshelf";
                        freq = 8000.0;
                        q = 0.7;
                        gain = 6.0;
                      }
                    ];
                  };
                }
              ];
              links = [
                {
                  output = "hpf:Out";
                  input = "eq:In 1";
                }
              ];
              inputs = ["hpf:In"];
              outputs = ["eq:Out 1"];
            };
            "audio.channels" = 2;
            "audio.position" = ["FL" "FR"];
            "capture.props" = {
              "node.name" = "laptop_speaker_eq";
              "media.class" = "Audio/Sink";
            };
            "playback.props" = {
              "node.name" = "laptop_speaker_eq_playback";
              "node.passive" = true;
              "node.target" = "alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__Speaker__sink";
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
