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
