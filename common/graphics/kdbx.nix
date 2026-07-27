{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-secrets
    keepassxc
  ];
}
