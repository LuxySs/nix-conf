{ config, lib, ... }:

{
  options.settings.locale = {
    locale = lib.mkStrOption "en_US.UTF-8" "Locale (default)";
    timeZone = lib.mkStrOption "Europe/Brussels" "time zone";
  };

  config = with config.settings.locale; {
    i18n.defaultLocale = "${locale}";
    time.timeZone = "${timeZone}";
  };
}
