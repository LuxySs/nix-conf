{ lib, config, ... }:

{
  options.settings.locale = {
    main = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
    };
    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Brussels";
    };
  };

  config = with config.settings.locale; {
    i18n.defaultLocale = "${main}";
    time.timeZone = "${timeZone}";
  };
}

