{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ydict
  ];
}