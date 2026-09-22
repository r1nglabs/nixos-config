{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    walker
  ];
}