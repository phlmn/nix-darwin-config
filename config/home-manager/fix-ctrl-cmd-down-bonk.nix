{ config, ... } : {
  # This fixes the bonk sound on macOS when pressind cmd + ctrl + down in a text editor
  home.file."Library/KeyBindings/DefaultKeyBinding.dict".text = ''
    {
      "@^\UF701" = "noop:";
      "@^\UF702" = "noop:";
      "@^\UF703" = "noop:";
    }
  '';
}
