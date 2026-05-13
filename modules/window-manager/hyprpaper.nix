{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      hyprpaper
    ];

  services.hyprpaper = {
    enable = true;
    
    settings = {
      splash = false;

      wallpaper = [
      {
        monitor = "";
        path = "./train.png";
        fit_mode = "tile";
       }
     ];
    };

  };
}
