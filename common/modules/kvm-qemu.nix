{ ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.users.lynx.extraGroups = [ "libvirtd" ];

  # （可选）开启 SPICE 协议的相关支持，以实现虚拟机与宿主机之间的剪贴板双向同步
  services.spice-vdagentd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
