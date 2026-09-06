{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tor
    tor-browser
  ];
}
