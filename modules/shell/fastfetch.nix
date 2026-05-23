{config, pkgs, ...}:

{
   programs.fastfetch = {
     enable = true;

     settings = {
       logo = {
       source = "nixos";
       padding = {
         right = 1;
	 top = 1;
         };
       };
       display = {
  	 size = {
    	   binaryPrefix = "si";
  	 };
  	 separator = " → ";
  	 color = {
    	   keys = "magenta";
    	   title = "cyan";
  	 };
        };	     
       modules = [
  	"title"
  	"separator"
	{ type = "custom"; format = "┌─── Hardware ───────────────────┐"; }
	"cpu"
  	"gpu"
  	"memory"
  	"disk"
  	{ type = "custom"; format = "└────────────────────────────────┘"; }
	{ type = "custom"; format = "┌─── Software ───────────────────┐"; }
	"os"
  	"kernel"
  	{ type = "users"; format = "{1}"; }
  	"wifi"
  	"localip"
  	"battery"
        { type = "custom"; format = "└────────────────────────────────┘"; }
        "colors"
      ]; 
    };
  };
}
