{ lib, ... } : {
  home.activation = {
    copyVscodeFiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ''$DRY_RUN_CMD rsync -av ${builtins.toPath ./config}/ "$HOME/Library/Application Support/Code/User"
    '';
  };
}
