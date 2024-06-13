{ lib, config, ... }:

let
  cfg = config.locale;
in
{
  options.locale = {
    enable = lib.mkEnableOption "Enable locale module";

    defaultLocale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "The default locale setting.";
    };

    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Brussels";
      description = "The default timezone setting.";
    };

    consoleKeyMap = lib.mkOption {
      type = lib.types.str;
      default = "us-acentos";
      description = "The default console keymap setting.";
    };
  };

  config = lib.mkIf cfg.enable {
    i18n.defaultLocale = cfg.defaultLocale;
    time.timeZone = cfg.timeZone;
    console.keyMap = cfg.consoleKeyMap;
  };
}

