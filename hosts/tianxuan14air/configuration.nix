{ pkgs, config, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../../common/laptop.nix
    ];

  hardware.cpu.amd.updateMicrocode = true;
  boot.loader.timeout = 2;
  boot.extraModprobeConfig = ''
    options iwlwifi lln_disable=0 power_save=0
    options nvidia NVreg_RegistryDwords="EnableDynamicBoost=1;OPM=1"
  '';

  networking.hostName = "mercury";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  networking.networkmanager.wifi.powersave = false;
  networking.firewall.enable = false;
  zramSwap.enable = true;

  services = {
    asusd.enable = true;
    supergfxd.enable = true;
  };

  # 5060
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement = {
      enable = true;
      finegrained = false;
    };
  };

  environment.systemPackages = with pkgs; [
    asusctl
    supergfxctl
    nvtopPackages.full
    xrandr
    powertop
    mesa-demos
    roc-toolkit
    heroic
    protonup-qt
    protonplus
    lutris
  ];

  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text = builtins.toJSON {
    rules = [
      {
        pattern = {
          feature = "procname";
          matches = "niri";
        };
        profile = "Limit free buffer pool on Wayland compositors";
      }
    ];
    profiles = [
      {
        name = "Limit free buffer pool on Wayland compositors";
        settings = [
          {
            key = "GLVidHeapReuseRatio";
            value = 0;
          }
        ];
      }
    ];
  };

  system.stateVersion = "25.11";
}
