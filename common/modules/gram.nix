{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gram
  ];
}