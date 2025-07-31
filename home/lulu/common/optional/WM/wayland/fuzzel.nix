{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.fuzzel;
in
{
  options.settings.wm.fuzzel.enable = lib.mkEnableOption "fuzzel";

  config = lib.mkIf (cfg.enable) {
    programs.fuzzel = {
      enable = true;

      settings = {
        main = {
          font = lib.mkForce "Iosevka NF:weight=bold:size=15";
          prompt = "'❯ '";
          terminal = "${lib.getBin pkgs.foot}";
          width = 65;
        };
        colors = {
          background = lib.mkDefault "#1616164D";
          border = lib.mkDefault "#78afe3CC";
          match = lib.mkDefault "#ECE0A8CC";
          selection = lib.mkDefault "#78afe3CC";
          selection-match = lib.mkDefault "#ECE0A8CC";
          selection-text = lib.mkDefault "#161616CC";
          text = lib.mkDefault "#E2E0ECCC";
        };
        border = {
          radius = "20";
          width = "2";
        };
      };
    };

    home.packages = with pkgs; [ bemoji ];
  };
}
