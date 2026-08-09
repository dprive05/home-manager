{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.window-manager.waybar;
in
{
  config = lib.mkIf cfg {
    programs.waybar = {
      enable = true;

      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 36;
          spacing = 6;

          modules-left = [
            "clock"
            "hyprland/workspaces"
            "wlr/taskbar"
          ];

          modules-right = [
            "tray"
            "cpu"
            "memory"
            "temperature"
            "network"
            "pulseaudio"
            "backlight"
            "battery"
          ];

          "hyprland/workspaces" = {
            format = "{name}";
            on-click = "activate";
            tooltip = false;
          };

          "wlr/taskbar" = {
            format = "{icon}";
            icon-size = 16;
            icon-theme = "Papirus";
            on-click = "activate";
            on-click-middle = "close";
            tooltip = false;
          };

          "clock" = {
            format = "󰃭 {:%a %d %b  󰥔 %H:%M}";
            locale = "fr_FR.UTF-8";
            tooltip = false;
            on-click = "swaync-client -t -sw";
          };

          "cpu" = {
            format = " {usage}%";
            tooltip = false;
          };

          "memory" = {
            format = " {}%";
            tooltip = false;
          };

          "temperature" = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}C";
            format-icons = [
              ""
              ""
              ""
            ];
            tooltip = false;
          };

          "network" = {
            format-wifi = " {essid}";
            format-ethernet = "󰈀 Connecté";
            format-disconnected = "󰖪";
            tooltip = false;
          };

          "bluetooth" = {
            format = "";
            format-disabled = "󰂲";
            format-connected = "󰂱 {device_alias}";
            tooltip = false;
          };

          "pulseaudio" = {
            format = "{icon} {volume}%";
            format-muted = "󰝟";
            format-icons = {
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
            };
            on-click = "pavucontrol";
            tooltip = false;
          };

          "backlight" = {
            format = "{icon} {percent}%";
            format-icons = [
              "󰃞"
              "󰃟"
              "󰃠"
            ];
            tooltip = false;
          };

          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󰂄 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁼"
              "󰁾"
              "󰂀"
              "󰂂"
              "󰁹"
              "󰂁"
              "󰂃"
            ];
            tooltip = false;
          };

          "tray" = {
            spacing = 10;
          };

        };
      };

      style = ''
        @define-color base   #1e1e2e;
        @define-color mantle #181825;
        @define-color text   #cdd6f4;
        @define-color blue   #89b4fa;
        @define-color mauve  #cba6f7;
        @define-color green  #a6e3a1;
        @define-color red    #f38ba8;
        @define-color crust  #11111b;

        window#waybar {
          background-color: transparent;
        }

        #workspaces,
        #taskbar,
        #clock,
        #cpu,
        #memory,
        #temperature,
        #network,
        #bluetooth,
        #pulseaudio,
        #backlight,
        #battery,
        #tray {
           background-color: @base;
           color: @text;
           border-radius: 16px;
           padding: 4px 14px;
           margin: 6px 4px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
           font-family: "JetBrainsMono Nerd Font", "sans-serif";
           font-size: 14px;
           border: none;
           transition: all 0.3s ease;
        }

        #workspaces {
           padding: 4px 8px;
        }

        #workspaces button {
           padding: 2px 8px;
           color: @text;
           border-radius: 12px;
           margin: 0 4px;
           border: none;
           transition: all 0.3s ease;
        }

        #workspaces button:hover {
           background-color: rgba(205, 214, 244, 0.1);
        }

        #workspaces button.active {
           color: @base;
           background-color: @blue;
           box-shadow: 0 2px 4px rgba(137, 180, 250, 0.4);
        }

        #taskbar button {
           padding: 2px 6px;
           margin: 0 4px;
           border-radius: 12px;
           border: none;
           transition: all 0.3s ease;
        }

        #taskbar button:hover {
           background-color: rgba(205, 214, 244, 0.1);
        }

        #taskbar button.active {
           background-color: rgba(255, 255, 255, 0.1);
        }

        #clock {
           color: @mauve;
           font-weight: 600;
        }

        #battery.charging, #battery.plugged {
           color: @green;
        }

        #battery.critical:not(.charging) {
           color: @red;
           animation-name: blink;
           animation-duration: 0.5s;
           animation-timing-function: linear;
           animation-iteration-count: infinite;
           animation-direction: alternate;
        }


        @keyframes blink {
           to {
             background-color: #f38ba8;
             color: #1e1e2e;
           }
        }

      '';
    };
  };
}
