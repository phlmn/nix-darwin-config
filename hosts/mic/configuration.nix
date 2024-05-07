{ config, pkgs, lib, ... }:
{
  imports = [
    ../../profiles/desktop.nix
    ../../config/postgresql.nix
    ../../modules/syncthing-darwin.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/hosts/mic/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/hosts/mic/configuration.nix";
}
