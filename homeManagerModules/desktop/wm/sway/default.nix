{
  config,
  lib,
  myNixos,
  ...
}:

let
  cfg = config.settings.wm.sway // {
    enable = builtins.elem "sway" myNixos.wm;
  };
in
{
  imports = [
    ./../wayland # import the wayland utilities
  ];

  options.settings.wm.sway = {
    enable = lib.mkEnableOption "sway-wm";
  };

  config = lib.mkIf (cfg.enable) {

    settings.wm.wayland.enable = true; # import the wayland stuff

    wayland.windowManager.sway = {
      enable = true;
      config = {
        keybindings = {
          # === WM-Related ===
          "Mod4+Return" = "exec foot";
          "Mod4+Shift+q" = "kill";
          "Mod4+d" = "exec pkill -x fuzzel || fuzzel ";

          "Mod4+Shift+r" = "reload";
          "Mod4+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

          # === Windows ===
          "Mod4+h" = "focus left";
          "Mod4+j" = "focus down";
          "Mod4+k" = "focus up";
          "Mod4+l" = "focus right";

          "Mod4+Shift+h" = "move left";
          "Mod4+Shift+j" = "move down";
          "Mod4+Shift+k" = "move up";
          "Mod4+Shift+l" = "move right";

          "Mod4+r" = "mode resize";

          # === Layouts ===
          "Mod4+b" = "splith";
          "Mod4+v" = "splitv";
          "Mod4+o" = "fullscreen toggle";
          "Mod4+a" = "focus parent";

          "Mod4+s" = "layout stacking";
          "Mod4+t" = "layout tabbed";
          "Mod4+e" = "layout toggle split";

          "Mod4+f" = "floating toggle";
          "Mod4+m" = "focus mode_toggle";

          # === Workspaces ===
          "Mod4+1" = "workspace number 1";
          "Mod4+2" = "workspace number 2";
          "Mod4+3" = "workspace number 3";
          "Mod4+4" = "workspace number 4";
          "Mod4+5" = "workspace number 5";
          "Mod4+6" = "workspace number 6";
          "Mod4+7" = "workspace number 7";
          "Mod4+8" = "workspace number 8";
          "Mod4+9" = "workspace number 9";
          "Mod4+0" = "workspace number 10";

          "Mod4+Shift+1" = "move container to workspace number 1";
          "Mod4+Shift+2" = "move container to workspace number 2";
          "Mod4+Shift+3" = "move container to workspace number 3";
          "Mod4+Shift+4" = "move container to workspace number 4";
          "Mod4+Shift+5" = "move container to workspace number 5";
          "Mod4+Shift+6" = "move container to workspace number 6";
          "Mod4+Shift+7" = "move container to workspace number 7";
          "Mod4+Shift+8" = "move container to workspace number 8";
          "Mod4+Shift+9" = "move container to workspace number 9";
          "Mod4+Shift+0" = "move container to workspace number 10";

          "Mod4+Shift+z" = "move scratchpad";
          "Mod4+z" = "scratchpad show";
        };

        modes = {
          resize = {
            "h" = "resize shrink width 10px";
            "j" = "resize shrink height 10px";
            "k" = "resize shrink height 10px";
            "l" = "resize shrink width 10px";
            "Shift+h" = "resize grow width 10px";
            "Shift+j" = "resize grow height 10px";
            "Shift+k" = "resize grow height 10px";
            "Shift+l" = "resize grow width 10px";
            "Escape" = "mode default";
            "Return" = "mode default";
          };
        };

        input = {
          "*" = {
            xkb_layout = "us";
            xkb_options = "ctrl:nocaps";
          };
        };

        window = {
          titlebar = false;
          border = 2;
        };

        workspaceAutoBackAndForth = true; # Switch twice to return
        defaultWorkspace = "workspace number 1";

        gaps = {
          inner = 4;
          outer = 4;
          horizontal = 4;
          vertical = 4;
          top = 4;
          left = 4;
          bottom = 4;
          right = 4;
        };
      };
    };
  };
}
