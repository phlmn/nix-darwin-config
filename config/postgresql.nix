{ pkgs, ... }: {
  services.postgresql = {
    enable = false;
    package = pkgs.postgresql_13;
    dataDir = "/Users/phlmn/var/lib/postgresql/13";
  };
}
