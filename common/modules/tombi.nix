{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tombi
  ];
}