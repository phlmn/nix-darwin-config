{ config, pkgs, lib, ... }:
{
  imports = [
    <home-manager/nix-darwin>
    ../../profiles/desktop.nix
    ../../config/homebrew.nix
    ../../config/postgresql.nix
    ../../config/redis.nix
    ../../modules/syncthing-darwin.nix
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/hosts/mic/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/hosts/mic/configuration.nix";
}
