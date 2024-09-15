{ config, lib, ... }:

let
  cfg = config.settings.bash;

  bat_enabled = config.settings.bat.enable;
  bat_cat_replacement = {
    cat = "bat";
  };

  eza_enabled = config.settings.eza.enable;
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

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;

      shellAliases = lib.mkMerge [
        {
          ".." = "cd ..";
          "..." = "cd ../../";
          "...." = "cd ../../../";

          ng = "neovide & disown"; # neovim gui
        }
        (lib.mkIf bat_enabled bat_cat_replacement)
        (lib.mkIf eza_enabled eza_ls_replacement)
      ];

    };
  };
}
