{ config, pkgs, ... } : {
  home.file.".aerospace.toml".source = ./aerospace.toml;
  home.file.".config/aerospace/pip-move.sh".source = ./pip-move.sh;
  home.packages = [
    pkgs.aerospace
  ];
}
