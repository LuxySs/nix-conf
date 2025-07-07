{ config, lib, ... }:

let
  cfg = config.settings.fish;
in
{
  options.settings.fish.enable = lib.mkEnableOption "enable fish";

  config = lib.mkIf (cfg.enable) {
    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set -g fish_greeting"" 
        set -g fish_key_bindings fish_user_key_bindings
        set fish_cursor_insert block
      '';

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

      functions = {
        fish_user_key_bindings = ''
          function fish_user_key_bindings
            fish_hybrid_key_bindings

            bind -M insert \cy forward-word
            bind \cy forward-word
          end
        '';

        pwdc = ''
          function pwdc
            echo $(pwd)
            wl-copy $(pwd)
          end
        '';

        copycat = ''
          function copycat
            cat $argv[1] | wl-copy
          end
        '';
      };

    };
  };
}
