{ config, lib, ... }:

with lib;

let
  cfg = config.starshipModule;
  colors = config.lib.stylix.colors;
  base01 = colors.base01;
  base02 = colors.base02;
  base03 = colors.base03;
  base04 = colors.base04;
  base05 = colors.base05;
  base06 = colors.base06;
  base07 = colors.base07;
  base08 = colors.base08;
  base09 = colors.base09;
  base0A = colors.base0A;
  base0B = colors.base0B;
  base0C = colors.base0C;
  base0D = colors.base0D;
  base0E = colors.base0E;
  base0F = colors.base0F;
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
          "[░▒▓](#${base02})" +
          "[ ](bg:#${base02} fg:#${base0E})" +
          "[](bg:#${base02} fg:#${base02})" +
          "$directory" +
          "[](fg:#${base02} bg:#${base02})" +
          "$git_branch" +
          "$git_status" +
          "[](fg:#${base02} bg:#${base02})" +
          "$nodejs" +
          "$cmd_duration" +
          "[](fg:#${base02} bg:#${base02})" +
          "$python" +
          "[ ](fg:#${base02})" +
          "\n" +
          "[ ❯](fg:#${base0B})" +
          "[❯](fg:#${base0C})" +
          "[❯ ](fg:#${base0D})"
        ;

        directory = {
          style = "fg:#${base05} bg:#${base02}";
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
          style = "bg:#${base04}";
          format = "[[ $symbol $branch ](fg:#${base0D} bg:#${base03})]($style)";
        };

        git_status = {
          style = "bg:#${base04}";
          format = "[[($all_status$ahead_behind )](fg:#${base0D} bg:#${base03})]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:#${base0D}";
          format = "[[ $symbol ($version) ](fg:#${base0D} bg:#212736)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#${base0D}";
          format = "[[ $symbol ($version) ](fg:#${base0D} bg:#212736)]($style)";
        };

        golang = {
          symbol = "ﳑ";
          style = "bg:#${base0D}";
          format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
        };

        php = {
          symbol = "";
          style = "bg:#${base0D}";
          format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
        };

        python = {
          symbol = "";
          style = "bg:#${base0D}";
          format = "[[ $symbol ($version) ](fg:#${base0D} bg:#${base02})]($style)";
        };

        cmd_duration = {
          disabled = false;
          style = "bg:#${base0D}";
          format = "[[  $duration ](fg:#${base0D} bg:#${base02})]($style)";
        };
      };
    };
  };
}
