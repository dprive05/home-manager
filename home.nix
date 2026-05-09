{ 
  config,
  pkgs,
  zen-browser,
  ...
}:

{
  home = {
    username = "raph";
    homeDirectory = "/home/raph";
  };
  
  home.stateVersion = "25.11";
  
  home.packages = with pkgs; [   
   vesktop
   virtualbox
   deezer-enhanced
   microsoft-edge
   prismlauncher
   git
   unzip
   vlc
 
   # Polices
   nerd-fonts.jetbrains-mono
   nerd-fonts.symbols-only
   font-awesome
   
   #dépendance pour hyprland
   pavucontrol           # GUI son
   networkmanagerapplet  # fournit nm-connection-editor
   brightnessctl         # contrôle luminosité
   wireplumber           # fournit wpctl 
   playerctl             # pour mpris
   wofi			 #lunchbar
   brightnessctl         # pour le module brightness
   blueman               # GUI bluetooth 
   lm_sensors            # pour la température CPU
   wlogout
   swaynotificationcenter
   libnotify
  ] ++ [
   zen-browser
  ];
  
  programs = {
    waybar.enable = true;
  };

  services.hyprpaper = {
  enable = true;
  settings = {
    preload = [
      "/home/raph/.config/home-manager/train.png"
    ];
    wallpaper = [
      # By display
      # {
      #   monitor = "DP-2";
      #   path = "~/wallpapers/wallpaper2.jpg";
      # }
      # By default/fallback
      {
        monitor = "";
        path = "/home/raph/.config/home-manager/train.png"; 
        }
      ];
    };
  };
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
