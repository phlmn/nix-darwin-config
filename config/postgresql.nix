{ pkgs, ... }: {
  services.postgresql = {
    enable = false;
    package = pkgs.postgresql_18;
    dataDir = "/Users/phlmn/var/lib/postgresql/18";
  };
}
