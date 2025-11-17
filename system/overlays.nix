# system/overlays.nix
final: prev: {
  btop = prev.btop.overrideAttrs (old: {
    NIX_CFLAGS_COMPILE = "${old.NIX_CFLAGS_COMPILE or ""} -O3 -march=x86-64-v3 -mtune=generic";
  });
}
