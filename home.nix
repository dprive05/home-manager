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
 
  imports = [ ./modules ];
 
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
  

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
