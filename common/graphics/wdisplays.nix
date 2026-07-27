{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wdisplays
  ];
}