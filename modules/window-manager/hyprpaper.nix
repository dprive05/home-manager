{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      hyprpaper
    ];

  services.hyprpaper = {
    enable = true;
    
    settings = {
      splash = false;

      preload = [ ".config/home-manager/modules/window-manager/traim.png" ];

      wallpaper = [
      {
        monitor = "";
        path = ".config/home-manager/modules/window-manager/train.png";
       }
     ];
    };

  };
}
