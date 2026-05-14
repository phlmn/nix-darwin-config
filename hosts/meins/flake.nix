{
  description = "meins";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/ee09932cedcef15aaf476f9343d1dea2cb77e261";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."Meins" = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        home-manager.darwinModules.home-manager
      ];
    };
  };
}
