{
  description = "Home Manager configuration of raph";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
     inputs@{ 
       nixpkgs,
       home-manager,
       zen-browser,
       hyprland,
       catppuccin,
       ...
    }:
    let
      pkgs = import nixpkgs {
            inherit system;
            config = {
              allowUnfree = true;
            };
          };
      system = "x86_64-linux";
    in
    {
      homeConfigurations."raph" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
	  catppuccin.homeModules.catppuccin
          ./home.nix
        ];
	
	extraSpecialArgs = {
          inherit inputs;
	  zen-browser = zen-browser.packages.${system}.default;
        };
      };
    };
}
