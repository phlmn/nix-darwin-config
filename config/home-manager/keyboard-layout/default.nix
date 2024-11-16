{ config, lib, ... } : {
  home.activation.custom-keyboard-layout = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD rm -rf $VERBOSE_ARG "$HOME/Library/Keyboard Layouts/keyboard_phlmn_v2.bundle"
    $DRY_RUN_CMD cp -a -r $VERBOSE_ARG "${./keyboard_phlmn_v2.bundle}" "$HOME/Library/Keyboard Layouts/keyboard_phlmn_v2.bundle"
    $DRY_RUN_CMD chmod -R $VERBOSE_ARG 744 "$HOME/Library/Keyboard Layouts/keyboard_phlmn_v2.bundle"
 '';
}
