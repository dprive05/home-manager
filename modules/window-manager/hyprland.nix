{ config, pkgs, ... }:
{
  home.packages =
      with pkgs;
      [
	grim
	slurp
	wl-clipboard
	vlc
	imv
	evince
      ];

  catppuccin = {
      hyprland.enable = true;
      cursors = {
        enable = true;
        accent = "dark";
      };
    };
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        "audio/*" = [ "vlc.desktop" ];
        "video/*" = [ "vlc.desktop" ];
        "image/jpeg" = [ "imv.desktop" ];
        "image/png" = [ "imv.desktop" ];
        "image/gif" = [ "imv.desktop" ];
        "image/webp" = [ "imv.desktop" ];
        "text/plain" = [ "vim.desktop" ];
        "application/pdf" = [ "org.gnome.Evince.desktop" ];
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      };
   };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      
	################
	### MONITORS ###
	################
	monitor = [
	  "eDP-1, 2560x1600@165, 0x0, 1.60"		#framework monitor
	  "DP-10, 1920x1080@100, 0x0, 1"		#Asus monitor
	  "DP-9, 1920x1080@60, 1920x0, 1, transform, 1" #Samsung monitor
	  ", preferred, auto, 1" 			#plug a random monitor 
	];


	###################
	### MY PROGRAMS ###
	###################
	"$terminal" = "kitty";
	"$fileManager" = "dolphin";
	"$menu" = "vicinae toggle";
	"$browser" = "zen-beta";


	#################
	### AUTOSTART ###
	#################
	"exec-once" = [
	  "waybar"
	  "swaync"
	  "nm-applet --indicator"
	  "blueman-applet"
	  "hyprpaper"
	];

	exec = "${config.home.homeDirectory}/.config/home-manager/modules/window-manager/scripts/clamshell.sh check";

	
	############################
	### ENVIRONMENT VARIABLES ###
	#############################
	env = [
  	  "XCURSOR_SIZE,24"
  	  "HYPRCURSOR_SIZE,24"
	];


	#####################
	### LOOK AND FEEL ###
	#####################
	general = {
    	  gaps_in = 3;
    	  gaps_out = 5;
    	  border_size = 2;
    	  "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    	  "col.inactive_border" = "rgba(595959aa)";
    	  resize_on_border = false;
    	  allow_tearing = false;
    	  layout = "dwindle";
	};

	decoration = {
  	  rounding = 10;
    	  rounding_power = 2;
    	  active_opacity = 1.0;
    	  inactive_opacity = 1.0;

    	  shadow = {
       	    enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

	animations = {
          enabled = true;

    	  bezier = [ 
       	    "easeOutQuint,   0.23, 1,    0.32, 1"
            "easeInOutCubic, 0.65, 0.05, 0.36, 1"
            "linear,         0,    0,    1,    1"
            "almostLinear,   0.5,  0.5,  0.75, 1"
            "quick,          0.15, 0,    0.1,  1"
          ];
  
    	  animation = [
      	    "global,        1,     10,    default"
      	    "border,        1,     5.39,  easeOutQuint"
      	    "windows,       1,     4.79,  easeOutQuint"
      	    "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
      	    "windowsOut,    1,     1.49,  linear,       popin 87%"
     	    "fadeIn,        1,     1.73,  almostLinear"
     	    "fadeOut,       1,     1.46,  almostLinear"
            "fade,          1,     3.03,  quick"
      	    "layers,        1,     3.81,  easeOutQuint"
      	    "layersIn,      1,     4,     easeOutQuint, fade"
      	    "layersOut,     1,     1.5,   linear,       fade"
      	    "fadeLayersIn,  1,     1.79,  almostLinear"
      	    "fadeLayersOut, 1,     1.39,  almostLinear"
      	    "workspaces,    1,     1.94,  almostLinear, fade"
      	    "workspacesIn,  1,     1.21,  almostLinear, fade"
      	    "workspacesOut, 1,     1.94,  almostLinear, fade"
      	    "zoomFactor,    1,     7,     quick"
  	  ];
	};

	dwindle = {
    	  pseudotile = true; 
    	  preserve_split = true;
	};

	master = {
    	  new_status = "master";
	};

	misc = {
    	  force_default_wallpaper = -1; 
    	  disable_hyprland_logo = false;
	};


	#############
	### INPUT ###
	#############
	input = {
	  kb_layout = "us";
    	  kb_variant = "intl";

    	  follow_mouse = 1;

    	  sensitivity = 0;

    	  touchpad = {
            natural_scroll = false;
       	  };
        };

	gesture = "3, horizontal, workspace"; 

	device = {
    	  name = "epic-mouse-v1";
    	  sensitivity = -0.5;
	};


	###################
	### KEYBINDINGS ###
	###################
	"$mainMod" = "SUPER";

	bind = [
	  "$mainMod, RETURN, exec, $terminal"
	  "$mainMod, Q, killactive,"
	  "$mainMod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
	  "$mainMod, E, exec, $fileManager"
	  "$mainMod, V, togglefloating,"
	  "$mainMod, SPACE, exec, $menu"
	  "$mainMod, P, pseudo, # dwindle"
	  "$mainMod, J, layoutmsg, togglesplit"
	  "$mainMod, W, exec, $browser"
	  "SUPER, N, exec, swaync-client -t -sw"
	  "$mainMod, L, exec, hyprlock"

	  #Screenshot
	  "$mainMod SHIFT, S, exec, bash -c 'f=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png; grim -g \"$(slurp)\" $f && wl-copy --type image/png < $f'"


	  # Move focus with mainMod + arrow keys
	  "$mainMod, left, movefocus, l"
	  "$mainMod, right, movefocus, r"
	  "$mainMod, up, movefocus, u"
	  "$mainMod, down, movefocus, d"

	  #Move active windows in a active worspace
	  "$mainMod SHIFT, left, movewindow, l"
	  "$mainMod SHIFT, right, movewindow, r"
	  "$mainMod SHIFT, up, movewindow, u"
	  "$mainMod SHIFT, down, movewindow, d"

	  # Switch workspaces with mainMod + [0-9]
	  "$mainMod, 1, workspace, 1"
	  "$mainMod, 2, workspace, 2"
	  "$mainMod, 3, workspace, 3"
	  "$mainMod, 4, workspace, 4"
	  "$mainMod, 5, workspace, 5"
	  "$mainMod, 6, workspace, 6"
	  "$mainMod, 7, workspace, 7"
	  "$mainMod, 8, workspace, 8"
	  "$mainMod, 9, workspace, 9"
	  "$mainMod, 0, workspace, 10"

	  # Move active window to a workspace with mainMod + SHIFT + [0-9]
	  "$mainMod SHIFT, 1, movetoworkspace, 1"
	  "$mainMod SHIFT, 2, movetoworkspace, 2"
	  "$mainMod SHIFT, 3, movetoworkspace, 3"
	  "$mainMod SHIFT, 4, movetoworkspace, 4"
	  "$mainMod SHIFT, 5, movetoworkspace, 5"
	  "$mainMod SHIFT, 6, movetoworkspace, 6"
	  "$mainMod SHIFT, 7, movetoworkspace, 7"
	  "$mainMod SHIFT, 8, movetoworkspace, 8"
	  "$mainMod SHIFT, 9, movetoworkspace, 9"
	  "$mainMod SHIFT, 0, movetoworkspace, 10"

	  # Example special workspace (scratchpad)
	  "$mainMod, S, togglespecialworkspace, magic"
	  #"$mainMod SHIFT, S, movetoworkspace, special:magic"

	  # Scroll through existing workspaces with mainMod + scroll
	  "$mainMod, mouse_down, workspace, e+1"
	  "$mainMod, mouse_up, workspace, e-1"
	];

	# Move/resize windows with mainMod + LMB/RMB and dragging
	bindm = [
	  "$mainMod, mouse:272, movewindow"
	  "$mainMod, mouse:273, resizewindow"
	];

	# Laptop multimedia keys for volume and LCD brightness
	bindel = [ 
	  ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	  ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	  ", XF86MonBrightnessUp,   exec, brightnessctl set 5%+"
	  ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
	];

	bindl  = [
	  ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	  ", XF86AudioNext, exec, playerctl next"
	  ", XF86AudioPause, exec, playerctl play-pause"
	  ", XF86AudioPlay, exec, playerctl play-pause"
	  ", XF86AudioPrev, exec, playerctl previous"
	  ",XF86AudioLowerVolume, exec, pamixer -d 5"
	  ",XF86AudioRaiseVolume, exec, pamixer -i 5"
	  ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
	  ",XF86MonBrightnessUp, exec, brightnessctl set 10%+ "
	  ", switch:on:Lid Switch, exec, ~/.config/hypr/scripts/clamshell.sh close"
	  ", switch:off:Lid Switch, exec, ~/.config/hypr/scripts/clamshell.sh open"
	];


	windowrule = [
    	  {
    	    name = "suppress-maximize-events";
    	    "match:class" = ".*";
    	    suppress_event = "maximize";
  	  }

 	  {
    	    name = "fix-xwayland-drags";
    	    "match:class" = "^$";
   	    "match:title" = "^$";
    	    "match:xwayland" = true;
    	    "match:float" = true;
    	    "match:fullscreen" = false;
    	    "match:pin" = false;
     	    no_focus = true;
  	  }

  	  {
    	    name = "move-hyprland-run";
    	    "match:class" = "hyprland-run";
    	    move = "20 monitor_h-120";
    	   float = true;
	  }
        ];	


	workspace = [
 	  "1, exec, $browser"
 	  "10, monitor:DP-9"
	];

    };
  };
}
