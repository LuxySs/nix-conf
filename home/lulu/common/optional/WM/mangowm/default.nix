{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

let
  cfg = config.settings.wm.mangowm;

  monitorLines = lib.concatStringsSep "\n" (
    map (
      m:
      if m.enabled then
        "monitorrule=name:${m.name},width:${toString m.width},height:${toString m.height},refresh:${toString m.refreshRate},x:${toString m.x},y:${toString m.y}"
      else
        ""
    ) config.monitors
  );

  volumeUpCmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1";
  volumeDownCmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

  stylixEnabled = config.settings.stylix.enable; # check if stylix is enabled
  colors = # get the stylix colors if stylix is enabled else some other colors
    if stylixEnabled then
      config.lib.stylix.colors
    else
      {
        base00 = "#282828";
        base01 = "#3c3836";
        base02 = "#504945";
        base03 = "#665c54";
        base04 = "#bdae93";
        base05 = "#d5c4a1";
        base06 = "#ebdbb2";
        base07 = "#fbf1c7";
        base08 = "#fb4934";
        base09 = "#fe8019";
        base0A = "#fabd2f";
        base0B = "#b8bb26";
        base0C = "#8ec07c";
        base0D = "#83a598";
        base0E = "#d3869b";
        base0F = "#d65d0e";
      };

  mkColor = color: "0x${color}ff";
in
{
  imports = [ inputs.mango.hmModules.mango ];

  options.settings.wm.mangowm.enable = lib.mkEnableOption "mango wm";

  config = lib.mkIf (cfg.enable) {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      systemd.enable = false;
    };

    wayland.windowManager.mango = {
      enable = true;

      settings = {

        # Window effect
        blur = 0;
        shadows = 0;
        border_radius = 0;
        focused_opacity = 1.0;
        unfocused_opacity = 1.0;

        # Animation Configuration
        animations = 0;

        # Overview Setting
        enable_hotarea = 0;

        # Misc
        drag_tile_to_tile = 1;

        # Keyboard
        repeat = {
          rate = 50;
          delay = 300;
        };
        numlockon = 0;
        xkb_rules = {
          layout = "us";
          variant = "intl";
          options = "caps:swapescape";
        };

        # Appearance
        gappih = 5;
        gappiv = 5;
        gappoh = 10;
        gappov = 10;
        borderpx = 2;
        bordercolor = mkColor colors.base01;
        focuscolor = mkColor colors.base0D;
        urgentcolor = mkColor colors.base0B;
        globalcolor = mkColor colors.base0E;
        scratchpadcolor = mkColor colors.base0A;
        overlaycolor = mkColor colors.base0C;

        # layout
        tagrule = [
          "id:1,layout_name:tile"
          "id:2,layout_name:tile"
          "id:3,layout_name:tile"
          "id:4,layout_name:tile"
          "id:5,layout_name:tile"
          "id:6,layout_name:tile"
          "id:7,layout_name:tile"
          "id:8,layout_name:tile"
          "id:9,layout_name:tile"
        ];

        bind = [

          # reload config
          "SUPER,r,reload_config"

          # menu and terminal
          "SUPER,d,spawn_shell, pkill -x fuzzel || fuzzel"
          "SUPER,Return,spawn,foot"
          "SUPER,e,spawn,foot -e yazi"
          "SUPER+SHIFT,e,spawn,nautilus"
          "SUPER,b,spawn,firefox"
          "SUPER+SHIFT,b,spawn,firefox --private-window"
          "SUPER,s,spawn,foot -e nvim"

          # exit
          "SUPER,m,quit"
          "SUPER+SHIFT,q,killclient,"

          # switch window focus
          "SUPER,Tab,focusstack,next"
          "SUPER,h,focusdir,left"
          "SUPER,l,focusdir,right"
          "SUPER,k,focusdir,up"
          "SUPER,j,focusdir,down"

          # swap window
          "SUPER+SHIFT,k,exchange_client,up"
          "SUPER+SHIFT,j,exchange_client,down"
          "SUPER+SHIFT,h,exchange_client,left"
          "SUPER+SHIFT,l,exchange_client,right"

          # switch window status
          "SUPER,g,toggleglobal,"
          "ALT,Tab,toggleoverview,"
          "SUPER,f,togglefloating,"
          "ALT,a,togglemaximizescreen,"
          "SUPER,space,togglefullscreen,"
          "SUPER+SHIFT,space,togglefakefullscreen,"
          "SUPER,i,minimized,"
          "SUPER,o,toggleoverlay,"
          "SUPER+SHIFT,I,restore_minimized"
          "ALT,z,toggle_scratchpad"

          # scroller layout
          "ALT,e,set_proportion,1.0"
          "ALT,x,switch_proportion_preset,"

          # switch layout
          "SUPER,n,switch_layout"
          "SUPER,t,setlayout,tile"
          "SUPER,v,setlayout,vertical_grid"
          "SUPER,x,setlayout,scroller"
          "SUPER,p,spawn_shell,mmsg -l $(mmsg -L | fuzzel -d)"

          # tag switch
          "SUPER,Left,viewtoleft_have_client,0"
          "SUPER,Right,viewtoright_have_client,0"

          "SUPER,1,view,1,0"
          "SUPER,2,view,2,0"
          "SUPER,3,view,3,0"
          "SUPER,4,view,4,0"
          "SUPER,5,view,5,0"
          "SUPER,6,view,6,0"
          "SUPER,7,view,7,0"
          "SUPER,8,view,8,0"
          "SUPER,9,view,9,0"

          # tag: move client to the tag and focus it
          # tagsilent: move client to the tag and not focus it
          # "ALT,1,tagsilent,1"
          "SUPER+SHIFT,1,tagsilent,1,0"
          "SUPER+SHIFT,2,tagsilent,2,0"
          "SUPER+SHIFT,3,tagsilent,3,0"
          "SUPER+SHIFT,4,tagsilent,4,0"
          "SUPER+SHIFT,5,tagsilent,5,0"
          "SUPER+SHIFT,6,tagsilent,6,0"
          "SUPER+SHIFT,7,tagsilent,7,0"
          "SUPER+SHIFT,8,tagsilent,8,0"
          "SUPER+SHIFT,9,tagsilent,9,0"
          "ALT,1,tag,1,0"
          "ALT,2,tag,2,0"
          "ALT,3,tag,3,0"
          "ALT,4,tag,4,0"
          "ALT,5,tag,5,0"
          "ALT,6,tag,6,0"
          "ALT,7,tag,7,0"
          "ALT,8,tag,8,0"
          "ALT,9,tag,9,0"

          # monitor switch
          "ALT+SHIFT,Left,focusmon,left"
          "ALT+SHIFT,Right,focusmon,right"
          "SUPER+ALT,Left,tagmon,left"
          "SUPER+ALT,Right,tagmon,right"

          # gaps
          "ALT+SHIFT,X,incgaps,1"
          "ALT+SHIFT,Z,incgaps,-1"
          "ALT+SHIFT,R,togglegaps"

          # movewin
          "CTRL+SHIFT,Up,movewin,+0,-50"
          "CTRL+SHIFT,Down,movewin,+0,+50"
          "CTRL+SHIFT,Left,movewin,-50,+0"
          "CTRL+SHIFT,Right,movewin,+50,+0"

          # resizewin
          "SUPER+CTRL,k,resizewin,+0,-50"
          "SUPER+CTRL,j,resizewin,+0,+50"
          "SUPER+CTRL,h,resizewin,-50,+0"
          "SUPER+CTRL,l,resizewin,+50,+0"
        ];

        mousebind = [
          "SUPER,btn_left,moveresize,curmove"
          "SUPER,btn_right,moveresize,curresize"
          "NONE,btn_middle,togglemaximizescreen,0"
        ];

        axisbind = [
          "SUPER,UP,viewtoleft_have_client"
          "SUPER,DOWN,viewtoright_have_client"
        ];

        bindl = [
          "ALT,UP,                   spawn,${volumeUpCmd}"
          "ALT,DOWN,                 spawn,${volumeDownCmd}"
          "NONE,XF86AudioRaiseVolume,spawn,${volumeUpCmd}"
          "NONE,XF86AudioLowerVolume,spawn,${volumeDownCmd}"
          "NONE,XF86AudioMute,       spawn,wpctl set-mute   @DEFAULT_AUDIO_SINK@ toggle"
          "NONE,XF86AudioMicMute,    spawn,wpctl set-mute   @DEFAULT_AUDIO_SOURCE@ toggle"

          "NONE,XF86MonBrightnessUp,  spawn,brightnessctl -e4 -n2 set 5%+"
          "NONE,XF86MonBrightnessDown,spawn,brightnessctl -e4 -n2 set 5%-"
        ];

        exec-once = [
          (lib.getExe pkgs.quickshell)
          "awww-daemon"
        ];
      };

      extraConfig = ''
        ${monitorLines}
      '';

      autostart_sh = ''
        # see autostart.sh
        # Note: here no need to add shebang
      '';
    };
  };
}
