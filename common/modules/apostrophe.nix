{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    apostrophe
  ];
}
