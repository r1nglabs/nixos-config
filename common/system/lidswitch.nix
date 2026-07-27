{ ... }:
{
  services.logind.settings.Login = {
    # HandleLidSwitch = "ignore"; # 任何情况下合屏都不挂起
    HandleLidSwitch = "suspend"; # 合屏默认睡眠
    HandleLidSwitchDocked = "ignore"; # 连接扩展坞/外接显示器时合屏无行为
    HandleLidSwitchExternalPower = "ignore"; # 仅在连接电源时合屏无行为
  };
}
