{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    bind = [

      "SUPER, Print, exec, grim -g \"$(slurp)\" - | swappy -f - "

      "SUPER, O, exec, pkill .ags-wrapped || ags"
      "SUPER, Home, exec, pkill wlogout || wlogout"
      "SUPER, End, exec, hyprlock"

      "SUPER, RETURN, exec, foot"
      "SUPER, E, exec, foot -e yazi"
      "SUPER SHIFT, E, exec, nautilus"
      "SUPER, B, exec, firefox"
      "SUPER SHIFT, B, exec, firefox --private-window"
      "SUPER, D, exec, pkill -x fuzzel || fuzzel"
      "SUPER, S, exec, foot -e nvim"
      "SUPER, C, exec, foot -e qalc"

      "SUPER SHIFT CTRL, End, exit,"

      "SUPER, Space, fullscreen"
      "SUPER SHIFT, Q, killactive"
      "SUPER, T, togglefloating"
      "SUPER SHIFT, T, exec, hyprctl dispatch workspaceopt allfloat"

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

      "SUPER SHIFT, 1, movetoworkspacesilent, 1"
      "SUPER SHIFT, 2, movetoworkspacesilent, 2"
      "SUPER SHIFT, 3, movetoworkspacesilent, 3"
      "SUPER SHIFT, 4, movetoworkspacesilent, 4"
      "SUPER SHIFT, 5, movetoworkspacesilent, 5"
      "SUPER SHIFT, 6, movetoworkspacesilent, 6"
      "SUPER SHIFT, 7, movetoworkspacesilent, 7"
      "SUPER SHIFT, 8, movetoworkspacesilent, 8"
      "SUPER SHIFT, 9, movetoworkspacesilent, 9"

      # azerty binds #

      # "SUPER, ampersand, workspace, 1"
      # "SUPER, eacute, workspace, 2"
      # "SUPER, quotedbl, workspace, 3"
      # "SUPER, apostrophe, workspace, 4"
      # "SUPER, parenleft, workspace, 5"
      # "SUPER, section, workspace, 6"
      # "SUPER, egrave, workspace, 7"
      # "SUPER, exclam, workspace, 8"
      # "SUPER, ccedilla, workspace, 9"
      # "SUPER, agrave, workspace, 10"
      # 
      # "SUPER SHIFT, ampersand, movetoworkspacesilent, 1"
      # "SUPER SHIFT, eacute, movetoworkspacesilent, 2"
      # "SUPER SHIFT, quotedbl, movetoworkspacesilent, 3"
      # "SUPER SHIFT, apostrophe, movetoworkspacesilent, 4"
      # "SUPER SHIFT, parenleft, movetoworkspacesilent, 5"
      # "SUPER SHIFT, section, movetoworkspacesilent, 6"
      # "SUPER SHIFT, egrave, movetoworkspacesilent, 7"
      # "SUPER SHIFT, exclam, movetoworkspacesilent, 8"
      # "SUPER SHIFT, ccedilla, movetoworkspacesilent, 9"
      # "SUPER SHIFT, agrave, movetoworkspacesilent, 10"
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
  };
}
