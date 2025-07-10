{ config, pkgs, lib, ... }:
{
  imports = [
    ../../profiles/desktop.nix
    # ../../config/postgresql.nix
    ../../modules/syncthing-darwin.nix
  ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

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
      "autodesk-fusion"
    ];
  };
}
