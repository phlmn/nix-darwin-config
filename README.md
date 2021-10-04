# My `nix-darwin` config

This is my config for [nix-darwin](https://github.com/LnL7/nix-darwin) with [home-manager](https://github.com/nix-community/home-manager) which manages my macOS installation. I'm happy if you find some inspiration here but be aware this is early stage.

## Installation

First install nix in "multi-user mode", for example via `curl -L https://nixos.org/nix/install | sh -s -- --daemon --darwin-use-unencrypted-nix-store-volume` (see nix [multi-user mode](https://nixos.org/manual/nix/stable/#sect-multi-user-installation) and [macOS](https://nixos.org/manual/nix/stable/#sect-macos-installation) install guide). Then install [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager). After that you can deploy the configuration like this:

```sh
cd ~/.nixpkgs
git clone git@github.com:phlmn/nix-darwin-config.git
nix-darwin rebuild
```
