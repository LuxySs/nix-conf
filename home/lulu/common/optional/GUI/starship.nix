{ config, lib, ... }:

let
  cfg = config.settings.starship;
  stylixEnabled = config.settings.stylix.enable; # check if stylix is enabled
  stylixColors = config.lib.stylix.colors;

  colors = # get the stylix colors if stylix is enabled else some other colors
    if stylixEnabled then
      stylixColors
    else
      {
        base00 = "#282c34";
        base01 = "#3a3f58";
        base02 = "#4e5266";
        base03 = "#5a5f7a";
        base04 = "#6c71c4";
        base05 = "#93a1a1";
        base0A = "#268bd2";
        base0B = "#2aa198";
        base0C = "#b58900";
        base0D = "#6c71c4";
        base0E = "#d33682";
        base08 = "#dc322f";
      };
in
{
  options.settings.starship.enable = lib.mkEnableOption "Enable starship prompt";

  config = lib.mkIf (cfg.enable) {
    programs.starship = {
      enable = true;
      settings = {
        command_timeout = 3000;

        format =
          "[░▒▓](#${colors.base02})"
          + "[ ](bg:#${colors.base02} fg:#${colors.base0E})"
          + "[](bg:#${colors.base02} fg:#${colors.base02})"
          + "$directory"
          + "[](fg:#${colors.base02} bg:#${colors.base02})"
          + "$git_branch"
          + "$git_status"
          + "[](fg:#${colors.base02} bg:#${colors.base02})"
          + "$nodejs"
          + "$cmd_duration"
          + "[](fg:#${colors.base02} bg:#${colors.base02})"
          + "$python"
          + "[ ](fg:#${colors.base02})"
          + "\n"
          + "[ ❯](fg:#${colors.base0B})"
          + "[❯](fg:#${colors.base0C})"
          + "[❯ ](fg:#${colors.base0D})";

        directory = {
          style = "fg:#${colors.base05} bg:#${colors.base02}";
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
          style = "bg:#${colors.base04}";
          format = "[[ $symbol $branch ](fg:#${colors.base0D} bg:#${colors.base03})]($style)";
        };

        git_status = {
          style = "bg:#${colors.base04}";
          format = "[[($all_status$ahead_behind )](fg:#${colors.base0D} bg:#${colors.base03})]($style)";
        };

        nodejs = {
          symbol = "";
          style = "bg:#${colors.base0D}";
          format = "[[ $symbol ($version) ](fg:#${colors.base0D} bg:#212736)]($style)";
        };

        rust = {
          symbol = "";
          style = "bg:#${colors.base0D}";
          format = "[[ $symbol ($version) ](fg:#${colors.base0D} bg:#212736)]($style)";
        };

        golang = {
          symbol = "ﳑ";
          style = "bg:#${colors.base0D}";
          format = "[[ $symbol ($version) ](fg:#${colors.base0D} bg:#${colors.base02})]($style)";
        };

        php = {
          symbol = "";
          style = "bg:#${colors.base0D}";
          format = "[[ $symbol ($version) ](fg:#${colors.base0D} bg:#${colors.base02})]($style)";
        };

        python = {
          symbol = "";
          style = "bg:#${colors.base0D}";
          format = "[[ $symbol ($version) ](fg:#${colors.base0D} bg:#${colors.base02})]($style)";
        };

        cmd_duration = {
          disabled = false;
          style = "bg:#${colors.base0D}";
          format = "[[  $duration ](fg:#${colors.base0D} bg:#${colors.base02})]($style)";
        };
      };
    };
  };
}
