{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    upscaler
  ];
}
