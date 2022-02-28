{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  environment.systemPackages = with pkgs; [
    hydra-check

    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-nix-shell

    vim
    git
    htop
    tmux
    fd
    neovim
    ripgrep
    tldr
    tree
    cloc
    nmap

    nodejs-slim-14_x
    nodePackages.npm
    nodePackages.yarn

    python39
    python39Packages.pip
    pipenv

    jq
    yq

    iperf
  ];
}
