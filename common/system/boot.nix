{ ... }:
{
  boot.loader.systemd-boot.enable = true;

  boot.kernel.sysctl = {
    # 修复 tcp 连接 mtu 配置错误问题，以下配置同时对 ipv6 生效
    "net.ipv4.tcp_mtu_probing"=1;
    "net.ipv4.tcp_base_mss"=1024;
  };
}
