{ pkgs, ... }:
{
  programs.wireshark.enable = true;
  programs.wireshark.package = pkgs.wireshark;
  programs.wireshark.usbmon.enable = true;
  users.users.lynx.extraGroups = [ "wireshark" ];
}
