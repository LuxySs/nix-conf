{ config, lib, ... }:

let
  eza_enabled = config.settings.eza.enable;
  eza_ls_replacement = {
    ls = "eza --color=always --group-directories-first";
    la = "eza -a --color=always --group-directories-first";
    ll = "eza -l --color=always --group-directories-first";
    lla = "eza -la --color=always --group-directories-first";
    lt = "eza -aT --color=always --group-directories-first";

    "l." = "eza -al --color=always --group-directories-first ../";
    "l.." = "eza -al --color=always --group-directories-first ../../";
    "l..." = "eza -al --color=always --group-directories-first ../../../";
  };

  baseAliases = {
    ".." = "cd ..";
    "..." = "cd ../../";
    "...." = "cd ../../../";
    ng = "neovide & disown";
  };
in

lib.mkMerge [
  baseAliases
  (lib.mkIf eza_enabled eza_ls_replacement)
]
