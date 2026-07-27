{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    espeak-ng
    piper-tts
  ];
}
