{ pkgs, ... }:
{
  users.users.lynx = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "lp" "networkmanager" "input" "audio" "vedio" "libvirtd" ];
  };
}
