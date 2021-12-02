{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.lima
    pkgs.tilt
    pkgs.azure-cli
    pkgs.meslo-lgs-nf
  ];

  imports = [
    ./home-manager/alacritty.nix
    ./home-manager/fzf.nix
    ./home-manager/git.nix
    ./home-manager/neovim.nix
    ./home-manager/starship.nix
    ./home-manager/tmux.nix
    ./home-manager/vscode.nix
    ./home-manager/zsh.nix
  ];
}
