{ config, lib, ... }:

let
  cfg = config.settings.fish;
  aliases = import ./common_aliases.nix { inherit config lib; };
in
{
  options.settings.fish.enable = lib.mkEnableOption "enable fish";

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set -g fish_greeting"" 
        set -g fish_key_bindings fish_user_key_bindings
        set fish_cursor_insert block
      '';

      shellAliases = aliases;

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
