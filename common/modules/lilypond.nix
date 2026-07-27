{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lilypond
    python313Packages.python-ly
    watchexec
  ];
}
