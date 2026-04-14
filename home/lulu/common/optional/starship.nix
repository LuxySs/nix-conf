{ config, lib, ... }:

let
  cfg = config.settings.starship;
  stylixEnabled = config.settings.stylix.enable; # check if stylix is enabled

  colors = # get the stylix colors if stylix is enabled else some other colors
    if stylixEnabled then
      config.lib.stylix.colors
    else
      {
        base00 = "#282828";
        base01 = "#3c3836";
        base02 = "#504945";
        base03 = "#665c54";
        base04 = "#bdae93";
        base05 = "#d5c4a1";
        base06 = "#ebdbb2";
        base07 = "#fbf1c7";
        base08 = "#fb4934";
        base09 = "#fe8019";
        base0A = "#fabd2f";
        base0B = "#b8bb26";
        base0C = "#8ec07c";
        base0D = "#83a598";
        base0E = "#d3869b";
        base0F = "#d65d0e";
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
