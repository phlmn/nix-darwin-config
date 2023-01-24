{ config, ... } : {
  home.file."Library/Application Support/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink ./config/settings.json;
}
