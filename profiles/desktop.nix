{ pkgs, ... }:
{
  imports = [
    ./base.nix
    ../config/homebrew.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    postgresql_13
    redis
    ruby_3_1
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
    lima
    tilt
    azure-cli
    ffmpeg
    go
    pkg-config
    httpie
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
      "google-chrome"
      "alacritty"
      "hammerspoon"
      "enpass"
      "alfred"

      "android-studio"
      "bartender"
      "jitsi-meet"
      "libreoffice"
      "logitech-options"
      "sketch"
      "spotify"
      "notion"
      "vlc"
      "the-unarchiver"
      "postico"
      "telegram"
      "signal"
      "flux"
      "appcleaner"
      "kicad"
      "karabiner-elements"
      "microsoft-teams"
      "insomnia"
      "firefox"
      "autodesk-fusion360"
      "intellij-idea"
      "forticlient-vpn"
      "docker"
      "drawio"
      "bartender"
      "hyperswitch"
      "mumble"
      "sublime-text"
      "discord"
      "rawtherapee"
      "raycast"
      "keybase"
      "keeweb"
    ];

    masApps = {
      "Affinity Designer" = 824171161;
      "Affinity Photo" = 824183456;
      "Tyme 2" = 1063996724;
    };
  };
}
