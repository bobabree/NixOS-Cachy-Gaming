# home/programs/git.nix
{...}: {
  #===================================================================
  # VERSION CONTROL
  #===================================================================
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "bobabree";
        email = "bree.huynh@berkeley.edu";
      };
      init = {
        defaultBranch = "master";
      };
      url."git@github.com:".insteadOf = "https://github.com/";
      safe.directory = "/home/bree/dev/nixos";
    };
  };
}
