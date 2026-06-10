{ config, pkgs, ... }:

{
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
}
