# hosts/bree/system/programs/default.nix
{...}: {
  imports = [
    ./steam.nix
    ./stylix.nix
  ];
}
