{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fluffychat
  ];
}