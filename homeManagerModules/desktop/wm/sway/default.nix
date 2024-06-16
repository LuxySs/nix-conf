{config, lib, ... }:

{
  options.settings.wm.sway = {
    enable = lib.mkEnableOption "sway";
  };
  
  config = lib.mkIf (config.settings.wm.sway.enable) {
    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";
        # Use kitty as default terminal
        terminal = "kitty"; 
        startup = [
          # Launch Firefox on start
          {command = "firefox";}
        ];
      };
    };
  };
}
