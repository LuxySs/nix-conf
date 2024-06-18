{ config, pkgs, lib, ... }:

{
  options.settings.shell.fish.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enable fish";
  };

  config = lib.mkIf (config.settings.shell.fish.enable){
    programs.fish = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
      };

      shellInit = ''
          set -g fish_greeting""
      '';
    
      plugins = [
        {
          name = "z";
          src = pkgs.fetchFromGitHub {
            owner = "jethrokuan";
            repo = "z";
            rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
            sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
          };
        }
      ];

      functions = {
        fish_user_key_bindings = ''
          function fish_user_key_bindings
            fish_vi_key_bindings
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
