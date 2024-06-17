{ lib, config, ... }:

{
  options.settings.console = {
    keyMap = lib.mkOption {
      type = lib.types.str;
      default = "us-acentos";
      description = "The default console keyMap layout";
    };
  };

  config = {
    console.keyMap = config.settings.console.keyMap;
  };
}
