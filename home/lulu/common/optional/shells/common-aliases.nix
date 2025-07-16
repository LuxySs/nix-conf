{ config, lib, ... }:

let
  baseAliases = {
    ".." = "cd ..";
    "..." = "cd ../../";
    "...." = "cd ../../../";
  };

  ezaEnabled = config.settings.eza.enable;
  ezaAliases = {
    ls = "eza --color=always --group-directories-first";
    la = "eza -a --color=always --group-directories-first";
    ll = "eza -l --color=always --group-directories-first";
    lla = "eza -la --color=always --group-directories-first";
    lt = "eza -aT --color=always --group-directories-first";
  };

  neovideEnabled = config.settings.neovide.enable;
  neovideAliases = {
    ng = "neovide & disown";
  };

in

lib.mkMerge [
  baseAliases
  (lib.mkIf ezaEnabled ezaAliases)
  (lib.mkIf neovideEnabled neovideAliases)
]
