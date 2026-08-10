{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.shell.starship;
in
{
  config = lib.mkIf cfg {
    home.packages = with pkgs; [
      starship
    ];

    programs.starship = {
      enableZshIntegration = true;
      enable = true;
      settings = {
        add_newline = true;
        command_timeout = 1000;
        format = ''
          [ ](#74c7ec)| ($directory) $git_branch$git_status$git_commit : $cmd_duration
          $character'';
        character = {
          success_symbol = "[󰇥 ](#f9e2af)";
          error_symbol = "[󰇥 ](#f38ba8)";
        };
        cmd_duration = {
          format = "[took](#cdd6f4) [$duration]($style)";
          style = "#f9e2af";
        };
        directory = {
          home_symbol = "󰋞 ~";
          read_only_style = "197";
          read_only = "  ";
          format = "([$path]($style)[$read_only]($read_only_style))";
          style = "#cba6f7";
        };
        git_branch = {
          symbol = " ";
          format = "[$symbol $branch ]($style)";
          style = "#a6e3a1";
        };
        git_status = {
          format = "[($all_status$ahead_behind)]($style)";
          style = "#94e2d5";
          conflicted = "🏳";
          up_to_date = " ";
          untracked = " ";
          ahead = "⇡\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          behind = "⇣\${count}";
          stashed = " ";
          modified = " ";
          staged = "[++($count)](#89dceb)";
          renamed = "襁 ";
          deleted = " ";
        };
      };
    };
  };
}
