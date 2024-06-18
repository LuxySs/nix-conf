{ config, lib, ... }: 

{
  options.settings.browser = {
    qutebrowser.enable = lib.mkEnableOption "qutebrowser";
  };

  config = lib.mkIf (config.settings.browser.qutebrowser.enable) {
      programs.qutebrowser.enable = true;
    };
}
