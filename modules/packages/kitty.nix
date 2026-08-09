{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.application.kitty;
  font_size = if pkgs.stdenv.isDarwin then 14 else 12;
in
{
  config = lib.mkIf cfg {
    home.packages = with pkgs; [ fira-code ];
    programs.kitty = {
      enable = true;
      font = {
        name = "Fira Code";
        package = pkgs.fira-code;
        size = font_size;
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
  };
}
