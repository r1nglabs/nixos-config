{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk
    maven
  ];
}
