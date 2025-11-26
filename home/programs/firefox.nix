{...}: {
  #===================================================================
  # BROWSERS
  #===================================================================
  programs.firefox = {
    enable = true;

    # Power-efficient settings optimized for Intel Arc
    profiles.default = {
      extensions = {
        force = true;
      };

      settings = {
        # Enable custom CSS
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # Hardware video decoding (VA-API)
        "media.ffmpeg.vaapi.enabled" = true;
        "media.hardware-video-decoding.enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;

        # GPU-accelerated rendering (WebRender)
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;

        # Use system FFmpeg for better codec support
        "media.ffvpx.enabled" = false;
        "media.rdd-vpx.enabled" = false;

        # Force hardware compositing
        "layers.acceleration.force-enabled" = true;

        # Wayland integration
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # Battery optimization - reduce process count
        "dom.ipc.processCount" = 4;
      };
    };
  };
}
