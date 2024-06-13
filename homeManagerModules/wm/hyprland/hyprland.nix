{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.hyprlandModule;
in
{
  options.hyprlandModule = {
      enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland.settings = {

      # desktop_hyprland.conf

      env = [
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt6ct"
      ];
      exec-once = "swww-daemon";
   
      monitor = "DP-3,3440x1440@99.98Hz,0x0,1";

 
      # conf/animations.conf

      animation = {
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = "windows, 1, 6, wind, slide";
      };


      # conf/decoration.conf

      decoration = {
        # rounding = 1#
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = "on";
          ignore_opacity = true;
          xray = true;
          blurls = "waybar";
        };

        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
      
        drop_shadow = true;
        shadow_range = 30;
        shadow_render_power = 3;
        "col.shadow" = "0x66000000";
      }; 


      # conf/desktop_keyboard.conf

      input = { 
        kb_layout = "us";
        kb_variant = "intl";
        kb_options = "caps:swapescape";
      
        follow_mouse = 1;
      
        touchpad = {
          natural_scroll = "no";
        };
        
        sensitivity = -0.4;
        accel_profile = "flat";
      };


      # conf/desktop_workspacerules.conf

      workspace = [
        "name:1, monitor:DP-3"
        "name:2, monitor:DP-3"
        "name:3, monitor:DP-3"
        "name:4, monitor:DP-3"
        "name:5, monitor:DP-3"
        "name:6, monitor:DP-3"
        "name:7, monitor:DP-3"
        "name:8, monitor:DP-3"
        "name:9, monitor:DP-3"
        "name:10, monitor:DP-3"
      ];


      # conf/keybindings.conf

      bind = [
        "SUPER, Print, exec, ~/.config/hypr/scripts/captureArea_buffer.sh"
        "SUPER SHIFT, Print, exec, ~/.config/hypr/scripts/captureArea_save.sh"
        
        "SUPER SHIFT, S, exec, ~/.config/hypr/scripts/notes_screenshot/notes_screenshot.sh"
        
        "SUPER SHIFT, Print, exec, ~/.config/hypr/scripts/captureArea_save.sh"
        
        "SUPER, M, exec, pkill -x spt || foot --title spt -e spt"
        
        "SUPER SHIFT, M, exec, pkill -x cava || foot --title cava -e /usr/bin/cava"
        
        "SUPER, O, exec, pkill -x ags || ags"
        "SUPER, End, exec, swaylock --config ~/swaylock/config"
        
        "SUPER, RETURN, exec, foot"
        "SUPER, E, exec, foot -e /usr/bin/yazi"
        "SUPER SHIFT, E, exec, nautilus"
        "SUPER, B, exec, firefox"
        "SUPER SHIFT, B, exec, firefox --private-window"
        "SUPER, N, exec, emacsclient -c -a 'emacs'"
        "SUPER, D, exec, pkill -x fuzzel || fuzzel "
        "SUPER, S, exec, foot -e nvim"
        "SUPER, C, exec, foot -e qalc"
        
        "SUPER SHIFT CTRL, End, exit,"
        
        "ALT, H, exec, wtype -P left"
        "ALT, L, exec, wtype -P right"
        "ALT, J, exec, wtype -P down"
        "ALT, K, exec, wtype -P up"
        
        "SUPER, Space, fullscreen"
        "SUPER SHIFT, Q, killactive"
        "SUPER, T, togglefloating"
        "SUPER SHIFT, T, exec, hyprctl dispatch workspaceopt allfloat"
        
        "ALT, TAB, bringactivetotop"
        
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"
        
        "SUPER, mouse_down, workspace, e+1"
        "SUPER, mouse_up, workspace, e-1"
        
        # qwerty binds #
        
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        
        "SUPER SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        
        # azerty binds #
        
         "SUPER, ampersand, workspace, 1"
         "SUPER, eacute, workspace, 2"
         "SUPER, quotedbl, workspace, 3"
         "SUPER, apostrophe, workspace, 4"
         "SUPER, parenleft, workspace, 5"
         "SUPER, section, workspace, 6"
         "SUPER, egrave, workspace, 7"
         "SUPER, exclam, workspace, 8"
         "SUPER, ccedilla, workspace, 9"
         "SUPER, agrave, workspace, 10"
         
         "SUPER SHIFT, ampersand, movetoworkspacesilent, 1"
         "SUPER SHIFT, eacute, movetoworkspacesilent, 2"
         "SUPER SHIFT, quotedbl, movetoworkspacesilent, 3"
         "SUPER SHIFT, apostrophe, movetoworkspacesilent, 4"
         "SUPER SHIFT, parenleft, movetoworkspacesilent, 5"
         "SUPER SHIFT, section, movetoworkspacesilent, 6"
         "SUPER SHIFT, egrave, movetoworkspacesilent, 7"
         "SUPER SHIFT, exclam, movetoworkspacesilent, 8"
         "SUPER SHIFT, ccedilla, movetoworkspacesilent, 9"
         "SUPER SHIFT, agrave, movetoworkspacesilent, 10"
      ];

      binde = [
        # move focus
        "SUPER, h, movefocus, l"
        "SUPER, l, movefocus, r"
        "SUPER, k, movefocus, u"
        "SUPER, j, movefocus, d"

        # resize
        "SUPER CTRL, l, resizeactive, 100 0"
        "SUPER CTRL, h, resizeactive, -100 0"
        "SUPER CTRL, k, resizeactive, 0 -100"
        "SUPER CTRL, j, resizeactive, 0 100"

        # audio
        "ALT, up, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        "ALT, down, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"

        # brightness
        ",XF86MonBrightnessDown, exec, brightnessctl set 3%-"
        ",XF86MonBrightnessUp, exec, brightnessctl set 3%+"
      ];

      bindm = [ 
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      gestures.workspace_swipe = false;


      # conf/layouts.conf

      dwindle = {
          pseudotile = true;
          preserve_split = true;
      };
      master.new_is_master = true;


      # conf/misc.conf
      misc = {
          "disable_hyprland_logo" = true;
          "disable_splash_rendering" = true;
      };


      # conf/window.conf

      general = {
          gaps_in = 5;
          gaps_out = 7;
          border_size = 2;
          "col.active_border" = "rgba(00bdffde) rgba(ee0000da) 45deg";
          "col.inactive_border" = "rgba(eeeeee00)";
          layout = "dwindle";
      };


      # conf/windowrules.conf

      windowrulev2 = [
        "rounding 3, class:(Alacritty);"
        "rounding 3, class:(foot);"
        "float, class:(Nautilus);"
      ];
    };
  };
}

