{ config, pkgs, lib, ... }:
{
  imports = [
    ../../profiles/desktop.nix
    # ../../config/postgresql.nix
    ../../modules/syncthing-darwin.nix
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.nixpkgs/hosts/meins/configuration.nix
  environment.darwinConfig = "$HOME/.nixpkgs/hosts/meins/configuration.nix";
  networking.hostName = "Meins";
  networking.computerName = "Meins";

  homebrew.brewPrefix = "/opt/homebrew/bin/";

  services.syncthing = {
    enable = true;

    devices = {
      meins = {
        id = "RCO5SH7-WXOIQ73-65KT7EV-7LEGBLV-3IJQQXE-FIANJY7-AFED2SJ-C7NCMAN";
      };
    };

    folders = {
      # "/Users/phlmn/.vscode/extensions" = {
      #   id = "vscode_extensions";
      #   devices = [ "meins" ];
      # };
    };
  };

  homebrew = {
    casks = [
      "kicad" # slow to install, so not in desktop profile
    ];
  };
}
