{ config, lib, ... }:

let
  cfg = config.settings.starship;
  stylixEnabled = config.settings.stylix.enable; # check if stylix is enabled

  colors = # get the stylix colors if stylix is enabled else some other colors
    if stylixEnabled then
      config.lib.stylix.colors
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

  mkFg = fgColor: "fg:#${fgColor}";
  mkColors = fgColor: bgColor: "fg:#${fgColor} bg:#${bgColor}";
in
{
  options.settings.starship.enable = lib.mkEnableOption "Enable starship prompt";

  config = lib.mkIf (cfg.enable) {
    programs.starship = {
      enable = true;
      settings = with colors; {
        command_timeout = 3000;

        format =
          "[▒▓](${mkFg base02})"
          + "$os"
          + "[▓▒](${mkFg base02})"
          + "$directory"
          + "$git_branch"
          + "$git_status"

          ##### languages #####
          + "$c"
          + "$custom"
          + "$python"
          + "$rust"
          #####################

          + "$nix_shell"
          + "[](${mkFg base01})"
          + "\n"
          + "[ ❯](${mkFg base09})"
          + "[❯](${mkFg base0A})"
          + "[❯ ](${mkFg base0B})";

        os = {
          disabled = false;
          style = mkColors base0C base02;
          symbols = {
            NixOS = "";
            Windows = "󰍲";
            Ubuntu = "󰕈";
            SUSE = "";
            Raspbian = "󰐿";
            Mint = "󰣭";
            Macos = "󰀵";
            Manjaro = "";
            Linux = "󰌽";
            Gentoo = "󰣨";
            Fedora = "󰣛";
            Alpine = "";
            Arch = "󰣇";
            Artix = "󰣇";
            EndeavourOS = "";
            Debian = "󰣚";
            Redhat = "󱄛";
            RedHatEnterprise = "󱄛";
          };
          format = "[$symbol ]($style)";
        };

        directory = {
          style = mkColors base05 base01;
          format = "[ $path ]($style)";
          substitutions = {
            "~/Documents" = "󰈙 ";
            "~/Downloads" = " ";
            "~/Music" = " ";
            "~/Pictures" = " ";
            "~/.config" = "⚙️ ";
            "~" = " ";
          };
        };

        git_branch = {
          symbol = "";
          style = mkColors base0D base02;
          format = "[ $symbol $branch ]($style)";
        };

        git_status = {
          style = mkColors base0D base02;
          format = "[$all_status$ahead_behind ]($style)";
        };

        nix_shell = {
          symbol = "☃️";
          # other symbols: ❄️  
          style = mkColors base0D base01;
          format = "[$symbol]($style)";
        };

        c = {
          symbol = "";
          style = mkColors base0D base01;
          format = "[ $symbol ($version) ]($style)";
        };

        custom.cpp = {
          detect_extensions = [
            "cpp"
            "cc"
            "hpp"
          ];
          symbol = "";
          # other symbol: "󰙲 "
          style = mkColors base0D base01;
          command = "g++ --version | awk 'NR==1 {print $3}'";
          format = "[ $symbol ($output) ]($style)";
          disabled = false;

        };

        python = {
          symbol = "";
          style = mkColors base0D base01;
          format = "[ $symbol ($version) ]($style)";
        };

        rust = {
          symbol = "";
          style = mkColors base0D base01;
          format = "[ $symbol ($version) ]($style)";
        };
      };
    };
  };
}
