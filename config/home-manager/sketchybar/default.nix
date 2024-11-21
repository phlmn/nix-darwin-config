{ config, pkgs, ... } : {
  home.file.".config/sketchybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixpkgs/config/home-manager/sketchybar/config";

  home.packages = [
    pkgs.sketchybar-app-font
    pkgs.nerdfonts
  ];
}
