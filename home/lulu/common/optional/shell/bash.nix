{ config, lib, ... }:

let
  cfg = config.settings.bash;

  eza_ls_replacement = {
    ls = "eza --color=always --group-directories-first";
    la = "eza -a --color=always --group-directories-first";
    ll = "eza -l --color=always --group-directories-first";
    lla = "eza -la --color=always --group-directories-first";
    lt = "eza -aT --color=always --group-directories-first";

    # ls from above
    "l." = "eza -al --color=always --group-directories-first ../";
    "l.." = "eza -al --color=always --group-directories-first ../../";
    "l..." = "eza -al --color=always --group-directories-first ../../../";
  };
in
{
  options.settings.bash.enable = lib.mkEnableOption "enable bash";

  config = lib.mkIf (cfg.enable) {
    programs.bash = {

      enable = true;

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
      } // lib.mkIf (config.settings.eza.enable) eza_ls_replacement;

    };
  };
}
