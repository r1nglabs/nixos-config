{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    podman
    podman-compose
    podman-tui
  ];
}
