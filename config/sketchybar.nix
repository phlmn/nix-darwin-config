{ pkgs, ... }: {
  services.sketchybar = {
    enable = false;

    extraPackages = [
      pkgs.jq
      pkgs.aerospace
    ];
  };
}
