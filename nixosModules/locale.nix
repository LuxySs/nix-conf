{ lib, config, ... }:

{
  options.settings.locale = {
    main = lib.mkStrOption "en_US.UTF-8" "Locale (Main)";
    timeZone = lib.mkStrOption "Europe/Brussels" "time zone";
  };

  config = with config.settings.locale; {
    i18n.defaultLocale = "${main}";
    time.timeZone = "${timeZone}";
  };
}
