{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-decoder
  ];
}