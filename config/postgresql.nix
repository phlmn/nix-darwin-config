{ pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_13;
    dataDir = "/Users/phlmn/var/lib/postgresql/13";
  };
}
