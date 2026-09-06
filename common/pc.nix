{ pkgs, config, ... }:
{
  imports =
    [
      ./system/boot.nix
      ./system/kernel.nix
      ./system/upower.nix
      ./system/networkmanager.nix
      ./system/pipewire.nix
      ./system/bluetooth.nix
      ./system/nix-settings.nix
      ./system/user.nix
      ./system/unfree.nix
      ./system/timezone.nix
      ./system/nodefault.nix

      ./desktop.nix
    ];
}
