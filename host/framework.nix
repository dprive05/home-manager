{
  system,
  inputs,
  config,
  pkgs,
  lib,
  zen-browser,
  ...
}:

let
  window-manager = import ../modules/window-manager/default.nix {
    inherit
      inputs
      config
      pkgs
      lib
      ;
  };
  shell = import ../modules/shell/default.nix {
    inherit
      inputs
      config
      pkgs
      lib
      ;
  };
  packages = import ../modules/packages/default.nix {
    inherit
      inputs
      config
      pkgs
      lib
      zen-browser
      ;
  };
in
{
  imports = [
    packages
    shell
    window-manager
  ];

  home = {
    username = "raph";
    homeDirectory = "/home/raph";
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "vim";
    };
  };

  shell = {
    enable = true;
    starship = true;
    git = true;
  };

  window-manager = {
    enable = true;
    hyprland = true;
    hypridle = true;
    hyprlock = true;
    hyprpaper = true;
    vicinae = true;
    waybar = true;
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    accent = "mauve";
    flavor = "mocha";
  };

  application = {
    kitty = true;
    prismlauncher = true;
    vesktop = true;
    microsoft-edge = true;
    cisco-packet-tracer = true;
    libreoffice = true;
    obsidian = true;
    fonts = true;
    vlc = true;
    evince = true;
    imv = true;
    nautilus = true;
    zen = true;
  };

}
