{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{
  config = {
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
