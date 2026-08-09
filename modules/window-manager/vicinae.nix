{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.window-manager.vicinae;
in
{
  config = lib.mkIf cfg {
    home.packages = with pkgs; [ vicinae ];
    catppuccin.vicinae.enable = true;
    programs.vicinae = {
      enable = true;
      systemd = {
        enable = true;
      };
    };
  };
}
