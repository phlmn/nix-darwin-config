{ config, pkgs, lib, ... }:
{
  imports = [
    <home-manager/nix-darwin>
    ../../profiles/desktop.nix
    ../../config/postgresql.nix
    ../../modules/syncthing-darwin.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/hosts/salvatore/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/hosts/salvatore/configuration.nix";

  homebrew.brewPrefix = "/opt/homebrew/bin/";
}
