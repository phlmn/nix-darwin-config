{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    # Dev
    cloc
    git
    git-absorb
    git-crypt
    difftastic
    pre-commit
    gnupg
    awscli2
    (pkgs.callPackage ../packages/kmerge.nix {})

    # Node.js
    nodejs-slim_24
    nodePackages.npm
    nodePackages.yarn
    nodePackages.pnpm
    # nodePackages.cdktf-cli

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
    zoxide

    # Tools
    iperf
    jq
    tldr
    yq
  ];
}
