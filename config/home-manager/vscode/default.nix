{ config, ... } : {
  home.file."Library/Application Support/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixpkgs/config/home-manager/vscode/config/settings.json";
}
