{ pkgs, ... }:
{
# 允許普通用戶讀取 Intel RAPL 功耗數據（修復 MangoHud 功率顯示）
services.udev.extraRules = ''
  KERNEL=="intel-rapl:0", SUBSYSTEM=="powercap", ACTION=="add", RUN+="/bin/sh -c 'chmod o+r /sys/class/powercap/intel-rapl:0/energy_uj'"
'';

  environment.systemPackages = with pkgs; [
    mangohud
    mangojuice
    goverlay
  ];
}
