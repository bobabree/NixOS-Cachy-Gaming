# system/audio.nix
{...}: {
  #===================================================================
  # AUDIO
  #===================================================================

  # Use PipeWire (modern audio system)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Disable PulseAudio (replaced by PipeWire)
  services.pulseaudio.enable = false;

  # Real-time audio priority
  security.rtkit.enable = true;
}
