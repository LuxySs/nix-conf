{ config, lib, ... }: 

{
  options.settings.browsers = {
    qutebrowser.enable = lib.mkEnableOption "qutebrowser";
  };

  config = lib.mkIf (config.settings.browsers.qutebrowser.enable) {
      programs.qutebrowser.enable = true;
    };
}
