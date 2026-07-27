{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fragments
  ];
}