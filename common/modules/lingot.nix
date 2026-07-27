{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lingot
  ];
}