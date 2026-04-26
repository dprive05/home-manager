{
  description = "Home Manager configuration of raph";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
     inputs@{ 
       nixpkgs,
       home-manager,
       zen-browser,
       ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."raph" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
	
	extraSpecialArgs = {
          inherit inputs;
	  zen-browser = zen-browser.packages.${system}.default;
        };
      };
    };
}
