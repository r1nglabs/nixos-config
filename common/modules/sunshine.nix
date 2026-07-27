{ pkgs, ... }:
{
# 开启 Sunshine 远程桌面服务
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true; # 允许 KMS 硬件抓屏
  };

  # 允许 Sunshine 需要的虚拟键盘鼠标驱动
  boot.kernelModules = [ "uinput" ];
  hardware.uinput.enable = true;
}
