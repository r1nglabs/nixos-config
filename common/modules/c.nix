{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    llvmPackages.clang
  ];
}
