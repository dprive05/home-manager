{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.window-manager.hypridle;
in
{
  config = lib.mkIf cfg {
    home.packages = with pkgs; [
      hypridle
    ];
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
      };
    };
  };
}
