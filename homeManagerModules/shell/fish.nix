{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.settings.shell.fish;
in
{
  options.settings.shell.fish.enable = lib.mkDisableOption "enable fish";

  config = lib.mkIf (cfg.enable) {
    programs.fish = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";

        "v" = "nvim";
        "vi" = "nvim";
        "vim" = "nvim";
      };

      shellInit = ''
        set -g fish_greeting""
        set -g fish_key_bindings fish_hybrid_key_bindings
      '';

      functions = {
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
