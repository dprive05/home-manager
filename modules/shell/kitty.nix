{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [ fira-code ];

  programs.kitty = {
    
    enable = true;
 
    font = {
       name = "Fira Code";
       package = pkgs.fira-code;
       size = 12.5;
    };

    settings = {
       disable_ligatures = "never";
       confirm_os_window_close = 0;
       enable_audio_bell = false;
       hide_window_decorations = true;
       term = "xterm-256color";
    };
  };
  catppuccin.kitty.enable = true;
}

