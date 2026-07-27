{ pkgs, ... }:
{
  services.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;
  services.gnome.core-developer-tools.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  environment.systemPackages = with pkgs; [
    gnome
  ];
}
