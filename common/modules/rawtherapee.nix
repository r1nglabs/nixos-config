{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rawtherapee
  ];
}