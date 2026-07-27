{ pkgs, ... }:
{
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus
    sushi
    nautilus-open-any-terminal
  ];
}
