{ config, lib, ... }:

{
  options.settings.console = {
    keyMap = lib.mkStrOption "us-acentos" "keyMap";
  };

  config = {
    console.keyMap = config.settings.console.keyMap;
  };
}
