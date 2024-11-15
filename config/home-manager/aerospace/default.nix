{ config, pkgs, ... } : {
  home.file.".aerospace.toml".source = ./aerospace.toml;
  home.packages = [
    pkgs.aerospace
  ];
}
