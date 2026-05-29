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
    bat = {
      enable = true;
      config.theme = "Catppuccin Mocha";
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
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
      "cl" = "clear && fastfetch";

      #git 
      "ga" = "git add .";
      "gc" = "git commit -m";
      "gp" = "git push";
      "gpp" = "git pull";
      "gs" = "git status";

      #nix
      "rebuild" = "nixos-rebuild switch --flake /etc/nixos/ --impure";
      "hms" = "home-manager switch --flake .#raph";

    };
    
    # Variables d'environnement
    sessionVariables = {
      EDITOR = "vim";
    };

    # Plugins zsh
    plugins = [
      {
         name = "zsh-completions";
         src = pkgs.zsh-completions;
         file = "share/zsh-completions/zsh-completions.zsh";
      } 
      {
         name = "zsh-autosuggestions";
         src = pkgs.zsh-autosuggestions;
         file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
         name = "zsh-syntax-highlighting";
         src = pkgs.zsh-syntax-highlighting;
         file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      
    ];
    initContent = ''
    fastfetch
    '';    
  };
}

