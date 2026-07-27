{ pkgs, ... }:
{
  systemd.services.v2raya.environment.V2RAYA_VERBOSE = "true";
  services.v2raya.enable = true;
}
