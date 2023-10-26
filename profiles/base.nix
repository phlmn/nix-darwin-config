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
    # Dev
    cloc
    git
    gitAndTools.git-absorb
    git-crypt
    difftastic
    pre-commit
    gnupg

    # Node.js
    nodejs-slim-18_x
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm

    # Nix
    hydra-check

    # Python
    pipenv
    python3
    python3Packages.pip
    poetry
    pdm

    # OS Essentials
    fd
    htop
    neovim
    nmap
    ripgrep
    tmux
    tree
    vim
    openssl

    # Shell
    zsh
    zsh-autosuggestions
    zsh-nix-shell
    zsh-syntax-highlighting

    # Tools
    iperf
    jq
    tldr
    yq
  ];
}
