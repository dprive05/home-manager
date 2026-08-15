{
  config,
  lib,
}:

let
  cfg = config.shell.git;
in
{
  config = lib.mkIf cfg {
    programs.git = {
      enable = true;
      ignores = [
        ".DS_Store"
        "*.swp"
        "*.swo"
        "*.swm"
        "*.swu"
        "node_modules/"
        ".env"
      ];
      settings = {
        alias = {
          "a" = "add";
          "c" = "commit -m";
          "p" = "push";
          "r" = "restore";
          "s" = "status";
          "br" = "branch";
          "co" = "checkout";
          "pp" = "pull";
        };
        core = {
          editor = "vim";
          pager = "bat -p";
        };
        pull = {
          rebase = true;
        };
        push = {
          autoSetupRemote = true;
        };
        user = {
          name = "rchouraqui";
          email = "raphaelchouraqui92@gmail.com";
        };
      };
    };
  };
} 
