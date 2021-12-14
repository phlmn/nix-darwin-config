{ lib, ... }:
{
  home.activation = {
    copyHammerspoonFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ''$DRY_RUN_CMD rsync -uav ${builtins.toPath ./config}/ $HOME/.hammerspoon/
    '';
  };
}
