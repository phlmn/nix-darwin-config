{ pkgs, ... }:
{
  imports = [
    ./base.nix
    ../config/homebrew.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Collab
    syncthing

    # Databases
    postgresql_13
    redis
    ruby_3_1

    # Dev
    argocd
    (import (builtins.fetchTarball {
      # Descriptive name to make the store path easier to identify
      name = "nixos-unstable-with-working-azure-cli";
      # Commit hash for last successful build of working azure-core (https://hydra.nixos.org/build/169891156#tabs-summary)
      url = "https://github.com/nixos/nixpkgs/archive/7a4a3f2a73865c5930c38ed5541cf033c602b0ff.tar.gz";
      # Hash obtained using `nix-prefetch-url --unpack <url>`
      sha256 = "0mg0i2yzrqb56izb4c6xvdza7iwghhwhl488iwqhrfwqq99zvy4v";
    }) {}).azure-cli
    gh
    go
    httpie
    ktlint
    kubectl
    kubernetes-helm
    lima
    minicom
    rustup
    terraform
    tilt
    vscode

    # Mac Utilities
    mas

    # Office
    pandoc

    # Tools
    ffmpeg
    nodePackages.serve
    rink
  ];

  users.users.phlmn = {
    name = "Philipp";
    home = "/Users/phlmn";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.phlmn = {
    imports = [
      ../config/home-manager.nix
      ../config/home-manager/hammerspoon/default.nix
      ../config/home-manager/alacritty.nix
      ../config/home-manager/fonts.nix
      ../config/home-manager/fzf.nix
      ../config/home-manager/git.nix
      ../config/home-manager/neovim.nix
      ../config/home-manager/starship.nix
      ../config/home-manager/tmux.nix
      ../config/home-manager/vscode.nix
      ../config/home-manager/zsh.nix
    ];
  };

  homebrew = {
    casks = [
      # Browsers
      "firefox"
      "google-chrome"

      # Collab & Messaging
      "discord"
      "jitsi-meet"
      "keybase"
      "microsoft-teams"
      "mumble"
      "signal"
      "telegram"

      # Dev
      "alacritty"
      "android-studio"
      "azure-data-studio"
      "docker"
      "insomnia"
      "intellij-idea"
      "postico"
      "sublime-text"

      # Drivers etc.
      "logitech-options"

      # Graphics
      "drawio"
      "rawtherapee"
      "sketch"

      # Mac Utilities
      "alfred"
      "bartender"
      "bartender"
      "contexts"
      "flux"
      "hammerspoon"
      "karabiner-elements"
      "raycast"

      # Making
      "autodesk-fusion360"
      "kicad"

      # Media
      "spotify"
      "vlc"

      # Office
      "libreoffice"
      "notion"

      # Tools
      "appcleaner"
      "enpass"
      "forticlient-vpn"
      "keeweb"
      "the-unarchiver"
    ];

    masApps = {
      # Graphics
      "Affinity Designer" = 824171161;
      "Affinity Photo" = 824183456;
    };
  };
}
