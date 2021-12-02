{ config, pkgs, lib, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    postgresql_13
    redis
    mas
    kubectl
    kubernetes-helm
    ktlint
    minicom
    pandoc
    terraform
    nodePackages.serve
    rustup
    gh
    argocd
    vscode
    syncthing
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/hosts/meins/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/hosts/meins/configuration.nix";

  services.syncthing = {
    enable = true;

    devices = {
      meins = {
        id = "RCO5SH7-WXOIQ73-65KT7EV-7LEGBLV-3IJQQXE-FIANJY7-AFED2SJ-C7NCMAN";
      };
    };

    folders = {
      "/Users/phlmn/.vscode/extensions" = {
        id = "vscode_extensions";
        devices = [ "meins" ];
      };
    };
  };

  imports = [
    <home-manager/nix-darwin>
    ../users.nix
    ../common.nix
    ../../config/homebrew.nix
    ../../config/postgresql.nix
    ../../config/redis.nix
    ../../modules/syncthing-darwin.nix
  ];
}
