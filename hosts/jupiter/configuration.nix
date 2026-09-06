{ pkgs, config, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../common/pc.nix
    ];

  networking.hostName = "jupiter";

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = true;
  };
  system.stateVersion = "26.05";
}
