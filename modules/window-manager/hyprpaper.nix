{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.window-manager.hyprpaper;
in
{
  config = lib.mkIf cfg {
    home.packages = with pkgs; [
      hyprpaper
    ];

    services.hyprpaper = {
      enable = true;

      settings = {
        splash = false;

        preload = [ ".config/home-manager/modules/window-manager/wallpaper/wallpaper3.jpg" ];

        wallpaper = [
          {
            monitor = "";
            path = ".config/home-manager/modules/window-manager/wallpaper/wallpaper3.jpg";
          }
        ];
      };

    };
  };
}
