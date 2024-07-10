{ config, lib, ... }:

let
  cfg = config.settings;
in
{
  options.settings = {
    gc.deleteOlderThan = lib.mkIntOption 10 "delete older than (garbage collection)";
  };

  config = {
    nix.gc = {
      automatic = true;
      options = "--delete-older-than ${toString cfg.gc.deleteOlderThan}d";
    };
  };
}
