{ config, lib, ... }:

let
  cfg = config.settings.bash;

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
        (
          let
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
          lib.mkIf eza_enabled eza_ls_replacement
        )
      ];

    };
  };
}
