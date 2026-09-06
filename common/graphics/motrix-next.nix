{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    motrix-next
  ];
}