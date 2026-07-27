{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    buffer
  ];
}
