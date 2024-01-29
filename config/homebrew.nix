{
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "uninstall";
    };
  };
}
