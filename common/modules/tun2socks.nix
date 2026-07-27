{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tun2socks
  ];
}