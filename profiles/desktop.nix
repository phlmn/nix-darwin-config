{ pkgs, ... }:
{
  imports = [
    ./base.nix
    ../config/homebrew.nix
    ../config/aerospace.nix
    ../config/sketchybar.nix
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
    azure-cli
    gh
    go
    httpie
    ktlint
    kubectl
    kubernetes-helm
    kubectx
    sops
    age
    fluxcd
    kubelogin
    lima
    minicom
    rustup
    terraform
    k9s
    unixtools.procps # provides watch

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
    name = "phlmn";
    home = "/Users/phlmn";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.phlmn = {
    home.stateVersion = "22.05";

    imports = [
      ../config/home-manager/alacritty.nix
      ../config/home-manager/atuin.nix
      ../config/home-manager/aerospace/default.nix
      ../config/home-manager/direnv.nix
      ../config/home-manager/fonts.nix
      ../config/home-manager/git.nix
      ../config/home-manager/hammerspoon/default.nix
      ../config/home-manager/neovim.nix
      ../config/home-manager/starship.nix
      ../config/home-manager/sketchybar/default.nix
      ../config/home-manager/tmux.nix
      ../config/home-manager/vscode/default.nix
      ../config/home-manager/zsh.nix
      ../config/home-manager/fix-ctrl-cmd-down-bonk.nix
      ../config/home-manager/keyboard-layout/default.nix
    ];
  };

  homebrew = {
    brews = [
      "platformio"
    ];

    casks = [
      # Browsers
      "firefox"
      "google-chrome"

      # Collab & Messaging
      "discord"
      "jitsi-meet"
      "keybase"
      "mumble"
      "signal"
      "telegram"
      "ferdium"

      # Dev
      "alacritty"
      "android-studio"
      "azure-data-studio"
      "docker"
      "insomnia"
      "intellij-idea"
      "postico"
      "sublime-text"
      "visual-studio-code"

      # Drivers etc.
      "logitech-options"

      # Graphics
      "drawio"
      "rawtherapee"
      "sketch"
      "figma"

      # Mac Utilities
      "bartender"
      "contexts"
      "hammerspoon"
      "raycast"

      # Media
      "spotify"
      "vlc"

      # Office
      "libreoffice"
      "notion"
      "obsidian"
      "nextcloud"

      # Tools
      "appcleaner"
      "enpass"
      "bitwarden"
      "the-unarchiver"
      "balenaetcher"

      # apple default fonts
      "font-sf-pro"
      "sf-symbols"
    ];

    masApps = {
      # Graphics
      "Affinity Designer" = 824171161;
      "Affinity Photo" = 824183456;
    };
  };
}
