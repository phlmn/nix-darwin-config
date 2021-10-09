{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.vim
      pkgs.postgresql_13
      pkgs.redis
      pkgs.git
      pkgs.htop
      pkgs.tmux
      pkgs.zsh
      pkgs.neovim
      pkgs.ripgrep
      pkgs.tldr
      pkgs.mas
      pkgs.kubectl
      pkgs.kubernetes-helm
      pkgs.cloc
      pkgs.ktlint
      pkgs.minicom
      pkgs.nodejs-slim-14_x
      pkgs.nodePackages.npm
      pkgs.pandoc
      pkgs.packer
      pkgs.python3
      pkgs.terraform
      pkgs.tree
      pkgs.zsh-syntax-highlighting
      pkgs.zsh-autosuggestions
      pkgs.nodePackages.serve
      pkgs.rustup
      pkgs.fd
      pkgs.jq
      pkgs.yq
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  #environment.darwinConfig = "$HOME/.nixpkgs/darwin-configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_13;
    dataDir = "/Users/phlmn/var/lib/postgresql/13";
  };

  services.redis = {
    enable = true;
    bind = "127.0.0.1";
    dataDir = "/Users/phlmn/var/lib/redis";
  };

  homebrew = {
    enable = true;
    cleanup = "zap";
    autoUpdate = true;

    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
    ];

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
      "syncthing"
      "visual-studio-code"
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
    ];

    masApps = {
      "Affinity Designer" = 824171161;
      "Affinity Photo" = 824183456;
    };
  };

  users.users.phlmn = {
    name = "Philipp";
    home = "/Users/phlmn";
  };

  home-manager.users.phlmn = import ./users/phlmn.nix;
}
