{
  inputs,
  config,
  pkgs,
  lib,
  nixvim,
  ...
}:

let
  starship = import ./starship.nix {
    inherit
      inputs
      config
      pkgs
      lib
      ;
  };
  zsh = import ./zsh.nix {
    inherit
      inputs
      config
      pkgs
      lib
      ;
  };
  git = import ./git.nix {
    inherit
      config
      lib
      ;
  };

  cfg = config.shell;
in
{
  imports = [
    git
    starship
    zsh
  ];

  options.shell = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the shell config";
    };
    starship = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the Starship config";
    };
    git = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the git config";
    };
    nixvim = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the nixvim config";
    };
    lazygit = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the lazygit config";
    };
  };

   config = {
    home.packages = lib.mkIf cfg.nixvim [ nixvim ];
    programs = {lazygit.enable = cfg.lazygit;};
  };
}
