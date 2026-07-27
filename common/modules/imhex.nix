{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    imhex
  ];
}