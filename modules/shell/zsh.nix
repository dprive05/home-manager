{ config, pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      eza
      wget
      unzip
      nmap
    ];
  };

  programs = {
    fastfetch = {
      enable = true;
    };
    bat = {
      enable = true;
      config.theme = "Catppuccin Mocha";
    };
    
  };

  programs.zsh = {
    enable = true;

    # Historique
    history = {
        append = true;
        expireDuplicatesFirst = false;
        extended = false;
        findNoDups = true;
        ignoreAllDups = true;
        ignoreDups = true;
        ignoreSpace = true;
        path = "${config.home.homeDirectory}/.zsh_history";
        save = 5000;
        share = true;
        size = 5000;
      };

    # Aliases
    shellAliases = {
      "ls" = "eza -h --icons=always";
      "ll" = "ls -l";
      "l" = "ls -l";
      "la" = "ls -la";
      "cat" = "bat";
      "ssh" = "TERM=xterm-256color ssh";
    };

    # Variables d'environnement
    sessionVariables = {
      EDITOR = "vim";
    };

    # Plugins zsh
    plugins = [
      # exemple :
      # {
      #   name = "zsh-autosuggestions";
      #   src = pkgs.zsh-autosuggestions;
      # }
    ];
  };
}

