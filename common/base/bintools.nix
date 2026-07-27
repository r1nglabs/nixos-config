{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    llvmPackages.bintools
  ];
}
