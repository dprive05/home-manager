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
      ;
  };
in
{
  imports = [
    window-manager
    shell
    packages
  ];

  home = {
    username = "root";
    homeDirectory = "/root";
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
    enable = false;
    hyprland = false;
    hypridle = false;
    hyprlock = false;
    hyprpaper = false;
    vicinae = false;
    waybar = false;
  };

  catpputccin = {
    enable = true;
    autoEnable = true;
    accent = "mauve";
    flavor = "mocha";
  };

  application = {
    kitty = false;
    prismlauncher = false;
    vesktop = false;
    microsoft-edge = false;
    cisco-packet-tracer = false;
    libreoffice = false;
    obsidian = false;
    fonts = false;
    vlc = false;
    evince = false;
    imv = false;
    nautilus = false;
  };

}
