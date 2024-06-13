{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.starshipModule;
in
{
  options.starshipModule = {
      enable = lib.mkEnableOption "Enable starship";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      settings = {
        command_timeout = 3000;

        format = 
          "[░▒▓](#333333)" +
          "[ ](bg:#333333 fg:#1793d1)" +
          "[](bg:#333333 fg:#333333)" +
          "$directory" +
          "[](fg:#333333 bg:#333333)" +
          "$git_branch" +
          "$git_status" +
          "[](fg:#333333 bg:#333333)" +
          "$nodejs" +
          "$cmd_duration" +
          "[](fg:#333333 bg:#333333)" +
          "$python" +
          "[ ](fg:#333333)" +
          "\n" +
          "[ ❯](fg:#00bdff)" +
          "[❯](fg:#9d91a2)" +
          "[❯ ](fg:#ee0000)"
        ;

        directory = {
          style = "fg:#e3e5e5 bg:#333333";
          format = "[ $path ]($style)";
          substitutions = {
            "~/Documents" = "󰈙 ";
            "~/Downloads" = " ";
            "~/Music" = " ";
            "~/Pictures" = " ";
            "~/.config" = "⚙️";
            "~" = " ";
          };
        };

        git_branch = {
          symbol = "";
          style = "bg:#394260";
          format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
        };

        git_status = {
          style = "bg:#394260";
          format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        golang = {
          symbol = "ﳑ";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        php = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
        };

        python = {
          symbol = "";
          style = "bg:#212736";
          format = "[[ $symbol ($version) ](fg:#769ff0 bg:#1d2230)]($style)";
        };

        cmd_duration = {
          disabled = false;
          style = "bg:#1d2230";
          format = "[[  $duration ](fg:#769ff0 bg:#212736)]($style)";
        };
      };
    };
  };
}
