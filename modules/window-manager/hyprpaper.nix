{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.window-manager.hyprpaper;
  wallpaper = pkgs.fetchurl {
    url = "https://github.com/dprive05/home-manager/blob/main/modules/window-manager/wallpaper/wallpaper3.jpg?raw=true";
    sha256 = "0s29iar5cz9ajya1cw1b7jc0zq7m7k8js6qmj6ihj7iga6zr69id";
  };

in
{
  config = lib.mkIf cfg {
    home.packages = with pkgs; [
      hyprpaper
    ];

    home.file."Pictures/wallpaper.png".source = wallpaper;
    services.hyprpaper = {
      enable = true;

      settings = {
        splash = false;

        preload = [ "/home/${config.home.username}/Pictures/wallpaper.png" ];

        wallpaper = [
          {
            monitor = "";
            path = "/home/${config.home.username}/Pictures/wallpaper.png" ;
          }
        ];
      };

    };
  };
}
