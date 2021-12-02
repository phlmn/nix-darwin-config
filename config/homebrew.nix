{
  homebrew = {
    enable = true;
    cleanup = "zap";
    autoUpdate = true;
    brewPrefix = "/opt/homebrew/bin/";

    taps = [
      "homebrew/cask"
      "homebrew/cask-drivers"
    ];

    casks = [
      "google-chrome"
      "alacritty"
      "hammerspoon"
      "enpass"
      "alfred"

      "android-studio"
      "bartender"
      "jitsi-meet"
      "libreoffice"
      "logitech-options"
      "sketch"
      "spotify"
      "notion"
      "vlc"
      "the-unarchiver"
      "postico"
      "telegram"
      "signal"
      "flux"
      "appcleaner"
      "kicad"
      "karabiner-elements"
      "microsoft-teams"
      "insomnia"
      "firefox"
      "autodesk-fusion360"
      "intellij-idea"
      "forticlient-vpn"
      "docker"
      "drawio"
      "bartender"
      "hyperswitch"
      "mumble"
      "sublime-text"
    ];

    masApps = {
      "Affinity Designer" = 824171161;
      "Affinity Photo" = 824183456;
    };
  };
}
