{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    typesetter
  ];
}
