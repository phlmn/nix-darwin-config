{ config, pkgs, lib, ... }:
{
  imports = [
    ../../profiles/desktop.nix
    ../../config/postgresql.nix
    ../../modules/syncthing-darwin.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/hosts/mic/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/hosts/mic/configuration.nix";
}
