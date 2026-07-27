{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    readest
  ];
}