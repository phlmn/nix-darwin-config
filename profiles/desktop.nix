{ pkgs, ... }:
{
  imports = [
    ./base.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
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
    lima
    tilt
    azure-cli
    ffmpeg
    go
    pkg-config
    httpie
    pipenv
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
}
