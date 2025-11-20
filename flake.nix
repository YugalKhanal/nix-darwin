{
  description = "Nix Darwin macOS with NixVim from GitHub";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, nixvim, ... }:
  let
    configuration = import ./configuration.nix;
  in
  {
    darwinConfigurations."I-am-Batman-2" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
	  users.users.yugalkhanal = {
            name = "yugalkhanal";
            home = "/Users/yugalkhanal";
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

	        home-manager.users.yugalkhanal = import ./home.nix;

          home-manager.sharedModules = [
            nixvim.homeModules.nixvim 
            ./nixvim
            
            (import ./home.nix)
          ];
        }
      ];
    };
  };
}
