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
   deezer-enhanced
   microsoft-edge
   prismlauncher
   git
   unzip
   cisco-packet-tracer_9   
   libreoffice
   freecad

 
   # Polices
   nerd-fonts.jetbrains-mono
   nerd-fonts.symbols-only
   font-awesome
   
   #dépendance pour hyprland
   pavucontrol           # GUI son
   networkmanagerapplet  # fournit nm-connection-editor
   wireplumber           # fournit wpctl 
   playerctl             # pour mpris
   brightnessctl         # pour le module brightness
   blueman               # GUI bluetooth 
   lm_sensors            # pour la température CPU
   swaynotificationcenter
   libnotify
  ] ++ [
   zen-browser
  ];
  

  catppuccin.flavor = "mocha";  

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
