{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "uninstall";
    };

    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
    ];
  };
}
